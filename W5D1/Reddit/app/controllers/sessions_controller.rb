class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username], session_params[:password]
    )
    if @user
      login(@user)
      redirect_to subs_url
    else
      render :new
    end
  end

  def destroy
    logout if current_user
    redirect_to :new
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
