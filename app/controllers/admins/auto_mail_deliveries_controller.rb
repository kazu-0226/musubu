class Admins::AutoMailDeliveriesController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update]

  def index
    @auto_mails = AutoMailDelivery.all.order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    
  end

  def form
    @auto_mail = AutoMailDelivery.new
  end

  def edit
        
  end

  def update
    if @auto_mail.update(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time, :is_sent))
      redirect_to admins_auto_mail_delivery_path(@auto_mail), notice: '配信内容を更新しました'
    else
      flash.now[:alert] = '配信内容に誤り、空欄があります'
      render :edit
    end
  end

  def confirm
    @auto_mail = AutoMailDelivery.new(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time, :is_sent))
    if @auto_mail.valid?
      render :action => 'confirm'
    else
      flash.now[:alert] = '配信内容に誤り、空欄があります'
      render :action => 'form'
    end
  end

  def completed
    @auto_mail = AutoMailDelivery.new(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time, :is_sent))
    @auto_mail.save
  end

  def set_mail
    @auto_mail = AutoMailDelivery.find(params[:id])
  end

end
