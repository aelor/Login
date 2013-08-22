class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :stage_detail
      t.references :qanote, index: true

      t.timestamps
    end
  end
end
