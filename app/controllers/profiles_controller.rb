class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :introduce))
      redirect_to "/"
    else
      render "/profiles/edit"
    end
  end
end
