class CreateQanotes < ActiveRecord::Migration
  def change
    create_table :qanotes do |t|
      t.string :clientdetail
      t.string :productname
      t.string :projectname
      t.string :currenttag
      t.string :oldtag
      t.string :servername
      t.date :date
      t.string :developername
      t.string :gatekeeper
      t.string :uploadedfromtag
      t.string :tasknodetail
      t.string :patchnamedetail
      t.string :diff1
      t.string :diff2
      t.string :signature
      t.string :testedby

      t.timestamps
    end
  end
end
