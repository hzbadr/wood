class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.references :currency
      t.references :source, polymorphic: true
      t.references :destination, polymorphic: true
      t.date :date

      t.timestamps
    end
  end
end
