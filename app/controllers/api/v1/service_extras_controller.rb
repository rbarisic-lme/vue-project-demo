class Api::V1::ServiceExtrasController < ApplicationController
  def index
    @service_extras = ServiceExtra.all

    respond_to do |format|
      format.json { render :index, status: :ok }
    end
  end
end
# /api/v1/service_extras