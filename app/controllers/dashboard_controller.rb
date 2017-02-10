class DashboardController < ApplicationController
  
  before_action :validates_user
  
  def index
  end

  private 

  def validates_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to be signed in!"
    end
  end
  
end
