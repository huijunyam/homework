class SubsController < ApplicationController

  before_action :is_moderator?, only: [:edit, :update]
  before_action :require_user, only: [:new, :create]
  def new
    @current_user
    render :new
  end

  def index
    @current_user = current_user
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save!
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(sub_params)
      render :show
    else
      render :edit
    end
  end

  def is_moderator?
    @sub = Sub.find_by(id: params[:id])
    if current_user.id == @sub.moderator_id
      return true
    else
      redirect_to sub_url(@sub)
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:description, :title)
  end
end
