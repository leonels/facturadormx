class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :invoice_id
      t.integer :item_id
      t.string :name
      t.text :description
      t.integer :quantity, :default => 1
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
