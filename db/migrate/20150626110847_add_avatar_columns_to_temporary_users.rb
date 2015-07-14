class AddAvatarColumnsToTemporaryUsers < ActiveRecord::Migration
  def change
  	add_attachment :temporary_users, :image
  end
end
