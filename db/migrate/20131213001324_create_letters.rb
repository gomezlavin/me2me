class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :user_id
      t.string :subject
      t.text :body
      t.datetime :delivery_date
      t.timestamps
    end
  end
end
