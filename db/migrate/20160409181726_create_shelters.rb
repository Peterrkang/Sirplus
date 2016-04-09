class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
