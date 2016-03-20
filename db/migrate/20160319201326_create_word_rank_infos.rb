class CreateWordRankInfos < ActiveRecord::Migration
  def change
    create_table :word_rank_infos do |t|
      t.text :word
      t.integer :site_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
