class HomesController < ApplicationController
  def top
    @update_shops = Shop.where(is_deleted: false).order('shops.updated_at DESC').limit(3)
  end

  def about
  end

  def new
  end

  def login
  end
end
