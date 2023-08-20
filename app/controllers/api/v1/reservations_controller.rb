class Api::V1::ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: reservations
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: reservation
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      render json: { message: 'Reservation deleted successfully' }, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :spa_service_id)
  end
end
