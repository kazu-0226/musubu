class Batch::NewsStatus

  def self.news_status_check
    date = Date.today
    # 公開されており、公開終了日が当日以前のニュースを定義
    @news = News.where(open_status: true).where('end_date  <  ? ', date)
    # 更新対象があれば、news_status_updateメソッドを実行する
    if @news.present?
      news_status_update(@news)
    end
  end
  
  def self.news_status_update(news)
    news.each do |n| 
     n.update_attributes(open_status: "false")
     p "ニュースステータス更新"
    end
  end

end