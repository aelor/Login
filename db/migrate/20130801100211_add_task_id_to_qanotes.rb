class AddTaskIdToQanotes < ActiveRecord::Migration
  def change
    add_column :qanotes, :task_id, :integer
  end
end
