class CreateSaves < ActiveRecord::Migration
  def change
    create_table :saves do |t|
      t.string :name
      t.string :type
      t.string :account_number

      t.timestamps
    end
  end
end
