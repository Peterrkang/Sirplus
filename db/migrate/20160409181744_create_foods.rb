class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :provider_id
      t.text :description
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.time :expiration_time

      t.timestamps null: false
    end
  end
end
