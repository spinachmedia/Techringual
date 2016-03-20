class CreateWordMsts < ActiveRecord::Migration
  def change
    create_table :word_msts do |t|
      t.text :word
      t.integer :site_id
      t.text :url
      t.integer :count

      t.timestamps null: false
    end
  end
end
