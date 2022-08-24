# contents = [content: "Lorem ipsum dolor sit amet consectetur, adipisicing elit.",
#             content: "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Omnis, consequuntur doloribus hic quibusdam itaque dicta rem amet mollitia.",
#             content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia fugit minus ab inventore, quis soluta ducimus, eius at et repellendus incidunt odio, tempore libero dolorem molestiae! Totam expedita dolore sint.",
#             content: "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Debitis officiis suscipit minus inventore dignissimos ea expedita consectetur fugiat velit in. Possimus et soluta reprehenderit eum eius aut dolores illum perferendis. Lorem ipsum dolor, sit."
# ]

# Message.destroy_all

# 100.times do
#     product = Product.all.sample
#     user = (User.all - product.user).sample
#     conversation = Message.create[
#         {content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id},
#         {content: contents.sample, sender_id: product.user_id, recipient_id: user.id, book_id: product.book.id},
#         {content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id},
#         {content: contents.sample, sender_id: product.user_id, recipient_id: user.id, book_id: product.book.id},
#         {content: contents.sample, sender_id: user.id, recipient_id: product.user_id, book_id: product.book.id}
#     ]
#     conversation.count.times do |i|
#         puts "se creo una conversación entre#{conversation[i].sender} y #{conversation[i].recipient} sobre el libro #{conversation[i].product.book.title]}"
#     end
# end