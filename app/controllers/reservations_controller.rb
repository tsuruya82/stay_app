class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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
    @reservation = Reservation.find(params[:id])
    @reservation.delete
    redirect_to :reservations
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :number_of_customers, :user_id, :room_id)
    end

    def ensure_correct_user
      @reservation = Reservation.find(params[:id])
      if @reservation.user_id != current_user.id
        redirect_to '/'
      end
    end
end
