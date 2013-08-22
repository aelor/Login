class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :live_detail
      t.references :qanote, index: true

      t.timestamps
    end
  end
end
