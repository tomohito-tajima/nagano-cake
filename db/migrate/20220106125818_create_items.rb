class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: true
      t.datetime :created_at, null: false, default: -> { 'NOW()' }
      t.datetime :updated_at, null: false, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
