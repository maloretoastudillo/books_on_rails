class Product < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many_attached :images

  enum condition: [ :aceptable, :bueno, :muy_bueno, :como_nuevo, :nuevo ]
  enum status: [ :disponible, :comprometido]

  def mine
    self.where(user_id: @current_user.id)
  end
end
