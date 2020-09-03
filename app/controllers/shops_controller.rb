class ShopsController < ApplicationController
  before_action :authenticate_shop!
  before_action :set_shop, only: [:show, :edit, :update, :withdraw]

  def show
  end

  def edit
  end

  def withdraw
    
  end

  def index
    
  end

  def search
    
  end

  def update
    
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

end
