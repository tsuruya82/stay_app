class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def new
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      @room = @reservation.room
      render template: "rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to :reservations
    else
      @room = @reservation.room
      render template: "rooms/show"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    if @reservation.invalid?
      @room = @reservation.room
      render :show
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :number_of_customers, :user_id, :room_id)
    end
end
