class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_description
      t.string :task_assigned_to
      t.references :client, index: true
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
