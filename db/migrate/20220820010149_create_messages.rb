class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :book, null: false, foreign_key: true
      t.references :sender
      t.references :recipient

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :messages, :users, column: :recipient_id, primary_key: :id
  end
end
