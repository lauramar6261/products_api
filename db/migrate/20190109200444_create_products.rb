class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.date :date
      t.string :notes
      t.string :brand
      t.string :description
      t.string :color
      t.string :upc
      t.timestamps
    end
  end
end
