require 'faker'

Book.destroy_all


editorials = [ 'Planeta', 'Catalonia', 'Barco de Vapor', 'Urano', 'Teraideas', 'Nabu Press', 'Palibrio', 'Debolsillo', 'Booket', 'Alfaguara', 'Susaeta', 'Anagrama', 'Tuskets', 'Salamandra', 'LUMEN', 'Anagrama', 'Sixbarral']


for i in 0..11
    10.times do
        book = Book.create(
            title: Faker::Book.title,
            author: Faker::Book.author,
            editorial: editorials.sample,
            course: i,
            category: 0
        )
        book.image.push(Faker::Placeholdit.image)
        puts "se ha creado el libro #{book.title}, para el curso #{book.course}, en la categoría #{book.category}"
    end
    i = i + 1
end