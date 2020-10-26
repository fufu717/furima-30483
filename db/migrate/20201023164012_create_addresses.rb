class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :prefecture_id,    foreign_key: true
      t.string :city,              null: false
      t.string :address,          null: false
      t.string :building
      t.string :phone,             unique: true
      t.references :purchase,      foreign_key: true
      t.timestamps
    end
  end
end
