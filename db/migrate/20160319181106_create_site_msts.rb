class CreateSiteMsts < ActiveRecord::Migration
  def change
    create_table :site_msts do |t|
      t.text :contents_name
      t.text :home_url
      t.text :base_url

      t.timestamps null: false
    end
  end
end
