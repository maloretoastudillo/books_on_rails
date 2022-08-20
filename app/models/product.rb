class Product < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many_attached :images
end
