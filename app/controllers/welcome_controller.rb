class WelcomeController < ApplicationController
  def index
    redirect_to groups_path if logged_in?
  end

  def info
    redirect_to groups_path if logged_in?
  end

  def start
    redirect_to groups_path if logged_in?
  end
end
