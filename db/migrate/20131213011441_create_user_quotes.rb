class CreateUserQuotes < ActiveRecord::Migration
  def change
    create_table :user_quotes do |t|
      t.integer :user_id
      t.integer :quote_id
      t.date :delivery_date
      t.time :delivery_time
      t.date :last_sent
      t.integer :times_sent
      t.timestamps
    end
  end
end
