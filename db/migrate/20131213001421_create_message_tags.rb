class CreateMessageTags < ActiveRecord::Migration
  def change
    create_table :message_tags do |t|
      t.integer :message_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
