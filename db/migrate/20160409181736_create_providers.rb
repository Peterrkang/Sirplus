class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :email
      t.string :name
      t.string :address
      t.string :phone
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
