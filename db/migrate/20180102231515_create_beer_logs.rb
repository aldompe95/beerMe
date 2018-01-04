class CreateBeerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_logs do |t|
      t.belongs_to :user
      t.string :beer_id
      t.integer :quantity
      t.date :date
      t.timestamps
    end
  end
end
