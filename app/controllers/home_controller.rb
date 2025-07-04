class HomeController < ApplicationController
  def top
  end

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

end
