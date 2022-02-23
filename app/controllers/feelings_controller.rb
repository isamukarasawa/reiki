class FeelingsController < ApplicationController
  def index
    @feelings = Feeling.all
  end

  def show
    @feeling = Feeling.find(params[:id])
  end

  def new
    @feeling = Feeling.new
  end

  def create
    @feeling = Feeling.new(feeling_params)
    @feeling.user_id = current_user.id
    @feeling.save
    redirect_to feeling_path(@feeling)
  end

  def edit
    @feeling = Feeling.find(params[:id])
  end

  def update
    @feeling = Feeling.find(params[:id])
    @feeling.update(feeling_params)
    redirect_to feeling_path(@feeling)
  end

  private
  def feeling_params
    params.require(:feeling).permit(:title, :body, :image)
  end

end
