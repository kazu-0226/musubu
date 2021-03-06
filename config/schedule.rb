# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = Rails.env.to_sym
# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所。ここでエラー内容を確認する
set :output, "#{Rails.root}/log/cron.log"

# 毎週カテゴリを更新する
every 1.week do
  begin
    runner "Batch::CategoryCreate.g_category"
    rescue => e
      Rails.logger.error("aborted rails runner")
      raise e
  end
end

# 未読の通知が3件ある場合は通知する
every 1.days, at: '11:00 pm' do
  time = Date.new
  Rails.logger.error("-----------send mail-----------#{time}")
  runner "MailNotificationMailer.check_notice_mail.deliver_now"
  rescue => e
    Rails.logger.error("not mailer task")
    raise e
end

# メールの配信を実行する
every 1.minutes do
  runner "AutoMailDeliveryMailer.auto_delivery_mail.deliver_now", :output => 'cron.log'
  rescue => e
  Rails.logger.error("not mailer task")
  raise e
end

# ニュースを非公開にする
every 1.days, at: '0:00 pm' do
  begin
    runner "Batch::NewsStatus.news_status_check"
    rescue => e
      Rails.logger.error("aborted rails runner")
      raise e
  end
end

