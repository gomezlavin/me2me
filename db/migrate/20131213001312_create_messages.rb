class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :title
      t.text :idea
      t.date :delivery_date
      t.time :delivery_time
      t.date :last_sent
      t.integer :times_sent
      t.timestamps
    end
  end
end
