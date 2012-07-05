class AddAccountIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :account_id, :integer
  end
end
