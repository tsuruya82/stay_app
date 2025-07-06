class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def confirmation
    @room = Room.find(params[:reservation][:room_id])
    @user = User.find(params[:reservation][:user_id])
    @check_in_date = params[:reservation][:check_in_date]
    @check_out_date = params[:reservation][:check_out_date]
    @number_of_customers = params[:reservation][:number_of_customers]    
    @reservation = @room.reservations.new(reservation_params)

    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to reservations_path
    else
      flash[:alert] = "予約が完了できませんでした。"
      render :confirmation, status: :unprocessable_entity
    end
  end


  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = @room.reservations.new(reservation_params)
  end


  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in_date, :check_out_date, :total_date, :total_people, :total_fee).merge(user_id: current_user.id, room_id: params[:room_id])
    end
end
