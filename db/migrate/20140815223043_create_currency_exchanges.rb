class CreateCurrencyExchanges < ActiveRecord::Migration
  def change
    create_table :currency_exchanges do |t|
      t.references :safe, index: true
      t.references :source, index: true
      t.decimal :source_amount
      t.references :destination, index: true
      t.decimal :destination_amount
      t.decimal :exchange_rate
      t.text :description

      t.timestamps
    end
  end
end
