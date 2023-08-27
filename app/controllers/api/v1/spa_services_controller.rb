class Api::V1::SpaServicesController < ApplicationController
  def index
    spa_services = SpaService.all.order('created_at')
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

  def create
    spa_service = SpaService.new(spa_service_params)
    spa_service.description = spa_service.description.capitalize

    if spa_service.save
      render json: spa_service, status: :created
    else
      render json: { errors: spa_service.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def spa_service_params
    # Define the permitted parameters for creating a spa service here
    params.require(:spa_service).permit(:name, :description, :price, :image, :duration)
  end
end
