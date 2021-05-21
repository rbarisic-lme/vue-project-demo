require "ed25519"

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verifiy_origin_is_getid, only: [:getid_complete, :getid_started]

  def getid_started
    respond_to do |format|
      format.json { render plain: 'ok' }
    end
  end

  def getid_complete
    @user = User.find(request.params["metadata"]["externalId"])
    datetime = DateTime.current
    
    if request.params["overallResult"]["status"] == "approved"
      @user.update!({
        kyc_id: request.params["id"],
        kyc_verified_at: datetime,
        kyc_updated_at: datetime,
        kyc_denied_at: nil,
        kyc_verified_with_workflow: request.params["metadata"]["flowName"],
        kyc_pending: false
      })
    else
      @user.update!({
        kyc_id: request.params["id"],
        kyc_verified_at: nil,
        kyc_updated_at: datetime,
        kyc_denied_at: datetime,
        kyc_verified_with_workflow: request.params["metadata"]["flowName"],
        kyc_pending: false
      })
    end

    respond_to do |format|
      format.json { render plain: 'ok' }
    end
  end

  private

  protected
    def verifiy_origin_is_getid
      timestamp = request.headers["X-Timestamp"]
      signature = Base64.strict_decode64 request.headers["X-Signature"]

      pub_key = Base64.strict_decode64(ENV['getid_signature_public_key'])

      verify_key = Ed25519::VerifyKey.new(pub_key.last(32))

      message = request.body.read + timestamp

      begin
        verified = verify_key.verify(signature, message)

        respond_to do |format|
          format.json do
            render plain: 'ERROR', status: 403 unless verified
          end
        end
      rescue e
        Rails.logger.error e
      end
    end
end
