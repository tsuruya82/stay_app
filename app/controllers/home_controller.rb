class HomeController < ApplicationController
  before_action :ransack
  def top
  end

  def index
  end

  def tokyo_search
    @tokyos = Room.where('address LIKE ?','%東京%')
  end

  def osaka_search
    @osakas = Room.where('address LIKE ?','%大阪%')
  end

  def kyoto_search
    @kyotos = Room.where('address LIKE ?','%京都%')
  end

  def sapporo_search
    @sapporos = Room.where('address LIKE ?','%札幌%')
  end

  private

  def ransack
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
end
