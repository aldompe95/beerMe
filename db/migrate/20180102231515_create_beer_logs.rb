class CreateBeerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_logs do |t|
      t.belongs_to :user
      t.belongs_to :beer
      t.integer :quantity
      t.date :date
      t.timestamps
    end
  end
end
