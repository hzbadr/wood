class CreateCurrencyExchanges < ActiveRecord::Migration
  def change
    create_table :currency_exchanges do |t|
      t.references :safe, index: true
      t.references :source, index: true
      t.decimal :source_amount, precision: 8, scale: 2
      t.references :destination, index: true
      t.decimal :destination_amount, precision: 8, scale: 2
      t.decimal :exchange_rate, precision: 8, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
