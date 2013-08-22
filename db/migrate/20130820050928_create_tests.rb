class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :test_detail
      t.references :qanote, index: true

      t.timestamps
    end
  end
end
