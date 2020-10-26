class Admins::AutoMailDeliveriesController < ApplicationController
  def index
    
  end

  def form
    @auto_mail = AutoMailDelivery.new
  end

  def confirm

  end

  def completed

  end
end
