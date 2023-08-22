class Api::V1::SpaServicesController < ApplicationController
  def index
    spa_services = SpaService.all
    render json: spa_services
  end

  def show
    spa_service = SpaService.find(params[:id])
    render json: spa_service
  end

  def destroy
    reservation = SpaService.find(params[:id])
    reservation.toggle!(:is_removed)
  end
end
