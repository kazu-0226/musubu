class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))    
    InquiryMailer.send_mail(@inquiry).deliver
    render :action => 'thanks'
  end
end
