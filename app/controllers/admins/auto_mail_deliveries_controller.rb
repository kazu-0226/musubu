class Admins::AutoMailDeliveriesController < ApplicationController
  def index
    
  end

  def form
    @auto_mail = AutoMailDelivery.new
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

  end
end
