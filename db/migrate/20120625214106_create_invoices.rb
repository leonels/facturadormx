class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :organization_id
      t.date :issued_on
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
