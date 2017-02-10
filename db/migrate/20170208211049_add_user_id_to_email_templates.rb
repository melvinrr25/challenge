class AddUserIdToEmailTemplates < ActiveRecord::Migration
  def change
    add_reference :email_templates, :user, index: true
  end
end
