class NewsController < ApplicationController
  def index
    date = Date.today
    @news = News.where(open_status: true).where( 'start_date <= ? ', date ).where('end_date >= ? ', date).order('news.start_date DESC').page(params[:page]).per(5)
  end

  def show
    @news = News.find(params[:id])
  end
end
