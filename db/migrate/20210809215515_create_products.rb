class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :shop , foreign_key: true
      t.string :name
      t.string :category
      t.text :details
      t.text :image_data
      t.timestamps
    end
  end
end
