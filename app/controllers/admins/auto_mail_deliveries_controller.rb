class Admins::AutoMailDeliveriesController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update]

  def index
    @auto_mails = AutoMailDelivery.all
  end

  def show
    
  end

  def form
    @auto_mail = AutoMailDelivery.new
  end

  def edit
        
  end

  def update
    if @auto_mail.update(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time))
      redirect_to admins_auto_mail_delivery_path(@auto_mail)
    else
      render :edit
    end
  end

  def confirm
    @auto_mail = AutoMailDelivery.new(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time))
    if @auto_mail.valid?
      render :action => 'confirm'
    else
      render :action => 'form'
    end
  end

  def completed
    @auto_mail = AutoMailDelivery.new(params[:auto_mail_delivery].permit(:subject, :mail_type, :content, :target_type, :reservation_time))
    @auto_mail.save
  end

  def set_mail
    @auto_mail = AutoMailDelivery.find(params[:id])
  end

end
