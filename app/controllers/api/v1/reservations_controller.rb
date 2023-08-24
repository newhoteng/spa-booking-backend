class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.includes(:spa_service).where(user_id: params[:user_id])
    render json: reservations
  end

  # GET /api/v1/reservations/1
  def show
    reservation = Reservation.find(params[:id])
    render json: reservation
  end

  # POST /api/v1/reservations/1
  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reservations/1
  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      render json: { message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :spa_service_id)
  end
end
