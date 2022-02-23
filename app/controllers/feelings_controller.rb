class FeelingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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
    if @feeling.save
      redirect_to feeling_path(@feeling),  notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @feeling = Feeling.find(params[:id])
    if @feeling.user != current_user
      redirect_to feelings_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @feeling = Feeling.find(params[:id])
    if @feeling.update(feeling_params)
      redirect_to feeling_path(@feeling), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    feeling = Feeling.find(params[:id])
    feeling.destroy
    redirect_to feelings_path
  end

  private
  def feeling_params
    params.require(:feeling).permit(:title, :body, :image)
  end

end
