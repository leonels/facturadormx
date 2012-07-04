class AddAccountIdToBasicModels < ActiveRecord::Migration
  def change
    add_column :organizations, :account_id, :integer
    add_column :people, :account_id, :integer
    add_column :items, :account_id, :integer
    add_column :invoices, :account_id, :integer
  end
end
