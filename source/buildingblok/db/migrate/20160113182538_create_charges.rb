class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :chargeable, polymorphic: true, index: true
      t.decimal :amount
      t.string :unique_code
      t.boolean :paid
      t.boolean :refunded

      t.timestamps null: false
    end
    add_index :charges, :unique_code
  end
end
