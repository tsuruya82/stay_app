class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :charge_day, :address, :image, :user_id))
    if @room.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :charge_day, :address, :image))
      redirect_to :rooms
    else
      render 'edit'
    end
  end
  
end
