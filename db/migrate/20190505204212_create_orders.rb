class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :model
      t.integer :imei
      t.decimal :anual_price
      t.integer :payment_number_of_quotas
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
