class CreateEnglishMsts < ActiveRecord::Migration
  def change
    create_table :english_msts do |t|
      t.text :word
      t.text :mean
      t.boolean :valid

      t.timestamps null: false
    end
  end
end
