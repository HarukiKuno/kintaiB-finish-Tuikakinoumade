class CreateBases < ActiveRecord::Migration[5.1]
  def change
    create_table :bases do |t|
      t.integer :basenumber
      t.string :basename
      t.string :basetype

      t.timestamps
    end
  end
end
