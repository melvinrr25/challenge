class EmailController < ApplicationController
  
  before_action :validates_user
  
  def new
    begin
      @template = current_user.email_templates.find(params[:template])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to email_templates_path
    end
  end
  
  def create
    begin  
    if params[:file] #if there is a file to send
      EmailMailer.new_email(current_user,params[:to],params[:subject],params[:body],params[:file].read(),params[:file].original_filename).deliver
    else
      EmailMailer.new_email(current_user,params[:to],params[:subject],params[:body]).deliver
    end
      redirect_to email_templates_path, notice: "Your email has been sent succesfully!"
    rescue Net::ReadTimeout => e
      redirect_to email_templates_path, alert: "Sending time was exceeded, your email could not be sent, Please try again!"
    rescue Net::SMTPFatalError => e
      redirect_to email_templates_path, alert: "Recipient address invalid, your email could not be sent, Please try again!"
    rescue Net::SMTPServerBusy => e
      redirect_to email_templates_path, alert: "Email server is busy, your email could not be sent, Please try again!"
    end
  end
  
  private
  
  def validates_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to be signed in!"
    end
  end
  
end
