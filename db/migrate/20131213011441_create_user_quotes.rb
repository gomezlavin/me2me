class CreateUserQuotes < ActiveRecord::Migration
  def change
    create_table :user_quotes do |t|
      t.integer :user_id
      t.integer :quote_id
      t.datetime :delivery_date
      t.datetime :last_sent
      t.integer :times_sent
      t.timestamps
    end
  end
end
