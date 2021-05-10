require "ed25519"

class WebhooksController < ApplicationController
  before_action :verifiy_origin_is_getid, only: [:getid_complete]

  def getid_complete

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
      rescue e
        Rails.logger.error e
      end

      pp request.body.read

      respond_to do |format|
        format.json { render plain: 'OK' }
      end
    end
end
