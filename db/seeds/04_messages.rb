contents = ["Lorem ipsum dolor sit amet consectetur, adipisicing elit.",
            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Omnis, consequuntur doloribus hic quibusdam itaque dicta rem amet mollitia.",
            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia fugit minus ab inventore, quis soluta ducimus, eius at et repellendus incidunt odio, tempore libero dolorem molestiae! Totam expedita dolore sint.",
            "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis officiis suscipit minus inventore dignissimos ea expedita consectetur fugiat velit in. Possimus et soluta reprehenderit eum eius aut dolores illum perferendis. Lorem ipsum dolor, sit."
]

Message.destroy_all

500.times do
    product = Product.all.sample
    user = User.where.not(id: product.user.id).sample
    Message.create(content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id)
    Message.create(content: contents.sample, sender_id: product.user_id, recipient_id: user.id, book_id: product.book.id)
    Message.create(content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id)
    Message.create(content: contents.sample, sender_id: product.user_id, recipient_id: user.id, book_id: product.book.id)
    Message.create(content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id)
end