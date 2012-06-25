class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :rfc
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone
      t.string :fax
      t.string :website

      t.timestamps
    end
  end
end
