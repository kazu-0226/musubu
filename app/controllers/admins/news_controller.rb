class Admins::NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update]

  def index
    @news = News.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def form
    @news = News.new
  end

  def confirm
    @news = News.new(news_params)
    if @news.valid?
      render :action => 'confirm'
    else
      flash.now[:alert] = '配信内容に誤り、空欄があります'
      render :action => 'form'
    end
  end

  def completed
    @news = News.new(news_params)
    @news.save
  end

  def show
  end

  def edit
  end

  def update
    @news.update
  end

  private

  def news_params
    params.require(:news).permit(:news_image, :title, :content, :start_date, :end_date, :open_status )
  end

  def set_news
    @news = News.find(params[:id])
  end

end
