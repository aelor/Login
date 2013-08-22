class AddProjectNameToLive < ActiveRecord::Migration
  def change
    add_column :project_name,:index =>true
  end
end
