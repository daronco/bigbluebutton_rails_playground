class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :organization
      t.string :address
      t.string :phone
      t.string :city
      t.string :country
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
