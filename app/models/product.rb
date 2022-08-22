class Product < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many_attached :images

  enum condition: [ :malo, :bueno, :muy_bueno, :como_nuevo ]
  enum status: [ :disponible, :comprometido]
end
