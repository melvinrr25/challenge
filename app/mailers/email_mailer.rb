class EmailMailer < ActionMailer::Base
  
  default from: "myemailmarketingapp@gmail.com"

  def new_email(user, to,subject,body,file=nil,filename=nil)
    @user = user
    @body = body
    attachments[filename] = file if file!=nil
    mail to: to, subject: subject
  end
end
