class AddUserIdToQanotes < ActiveRecord::Migration
  def change
    add_column :qanotes, :user_id, :integer
  end
end
