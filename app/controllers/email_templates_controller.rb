class EmailTemplatesController < ApplicationController
  before_action :validates_user
  before_action :set_email_template, only: [:show, :destroy, :edit, :update]
  
  def index
    @email_template = current_user.email_templates.order(name: :asc).all
    
  end
  
  def show
  
  end
  
  def new 
    @email_template = EmailTemplate.new
  end
  
  def edit
    
  end
  
  def update
    if @email_template.update(email_template_params)
      redirect_to @email_template, notice: "Your template has been updated!"
    else
      render :edit
    end
  end
  
  def create
    
    @email_template = current_user.email_templates.new(email_template_params)
  
    if @email_template.save
      redirect_to @email_template
    else
      render :new
    end
    
  end

  def destroy
    @email_template.destroy
    redirect_to email_templates_path, notice: "Your template has been deleted!"	
  end
  
  # Private methods
  private 
  
  def set_email_template
    begin
      @email_template = current_user.email_templates.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to email_templates_path
    end
    
  end
  
  def email_template_params
    params.require(:email_template).permit(:name,:body,:subject)
  end
  
  def validates_user
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to be signed in!"
    end
  end
end
