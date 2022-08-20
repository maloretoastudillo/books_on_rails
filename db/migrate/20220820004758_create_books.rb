class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author
      t.string :editorial
      t.integer :course, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
