prices = [ 1000, 1500, 2000, 2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000, 7500, 8000, 8500, 9000]

Product.destroy_all

100.times do
    product = Product.create(
        condition: rand(Product.conditions.count),
        price: prices.sample,
        status: rand(Product.statuses.count),
        user_id: rand(1..User.all.size),
        book_id: rand(1..Book.all.size)
    )
    if product.book.category = 0
        product.images.attach(io: File.open("app/assets/images/book.jpg"), filename: "book.jpg")
        product.images.attach(io: File.open("app/assets/images/page.jpg"), filename: "page.jpg")
        product.images.attach(io: File.open("app/assets/images/book_back.jpg"), filename: "book_back.jpg")
    else
        product.images.attach(io: File.open("app/assets/images/study_text.jpg"), filename: "study_text.jpg")
        product.images.attach(io: File.open("app/assets/images/page.jpg"), filename: "page.jpg")
        product.images.attach(io: File.open("app/assets/images/text_back.jpg"), filename: "text_back.jpg")
    end
    puts "Se ha creado la publicación del libro #{product.book.title}, en estado: #{product.condition} a $#{product.price}."
end