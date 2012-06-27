class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
      t.string :phone_one
      t.string :phone_two
      t.integer :organization_id

      t.timestamps
    end
  end
end
