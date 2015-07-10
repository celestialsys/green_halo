class AddAvatarColumnsToTemporaryUsers < ActiveRecord::Migration
  def change
  	add_attachment :temporary_users, :avatar
  end
end
