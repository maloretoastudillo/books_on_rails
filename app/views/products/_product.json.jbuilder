json.extract! product, :id, :editorial, :condition, :price, :status, :user_id, :book_id, :created_at, :updated_at
json.url product_url(product, format: :json)
