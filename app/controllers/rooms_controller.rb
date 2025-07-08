class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    @rooms = current_user.rooms.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to :rooms
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
    if @room.update(room_params)
      redirect_to :rooms
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.delete
    redirect_to :rooms
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :charge_day, :address, :image, :user_id)
  end

  def ensure_correct_user
    @room = Room.find(params[:id])
    if @room.user_id != current_user.id
      redirect_to '/'
    end
  end
end
