class AddPaoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pao, :string
  end
end
