class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :quote
      t.string :category
      t.timestamps
    end
  end
end
