class Admin::UsersController < ApplicationController
  def index
    @users = User.all.eager_load(:orders)
  end

  def new
    @user = User.new
    @order = @user.orders.build
  end

end
