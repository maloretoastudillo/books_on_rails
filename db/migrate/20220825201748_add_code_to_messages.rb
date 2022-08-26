class AddCodeToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :code, :string
  end
end
