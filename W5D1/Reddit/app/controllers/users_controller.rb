class UsersController < ApplicationController
  def new
    @u = User.new
    render :new
  end

  def create
    @u = User.new(user_params)
    if @u.save
      login(@u)
      redirect_to subs_url
    else
      flash.now[:errors] = @u.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
