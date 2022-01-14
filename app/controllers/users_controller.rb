class UsersController < ApplicationController
  before_action :require_user
  def show
    @user = User.find(params[:id])
  end
end
