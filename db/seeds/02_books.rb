require 'faker'

editorials = [ 'Planeta', 'Catalonia', 'Barco de Vapor', 'Urano', 'Teraideas', 'Nabu Press', 'Palibrio', 'Debolsillo', 'Booket', 'Alfaguara', 'Susaeta', 'Anagrama', 'Tuskets', 'Salamandra', 'LUMEN', 'Anagrama', 'Sixbarral']
texts = [
    {title: 'Lenguaje y Comunicación 1°básico - Proyecto Saber Hacer', editorial:'Santillana', course: 0 , category: 1},
    {title: 'Caligrafía 1°básico', editorial: 'Caligrafix', course: 0 , category: 1},
    {title: 'Súper Matemáticos 1°', editorial:'Caligrafix', course: 0 , category: 1},
    {title: 'American Tiger 1 - Student Book', editorial:'Mc Millan', course: 0 , category: 1},
    {title: 'Lectópolis - Comprensión Lectora B', editorial:'Santillana', course: 1, category: 1},
    {title: 'Súper Matemáticos 2', editorial:'Caligrafix', course: 1 , category: 1},
    {title: 'Cs. sociales 2°básico - Saber Hacer', editorial:'Santillana', course: 1, category: 1},
    {title: 'American Tiger 1 - Student Book', editorial:'Mc Millan', course: 1 , category: 1},
    {title: 'Lectópolis Comprensión Lectora C', editorial:'Santillana', course: 2 , category: 1},
    {title: 'Cuaderno de Caligrafía horizontal 3°básico', editorial:'Sopena', course: 2 , category: 1},
    {title: 'Sendas Matemática 3°básico - Proyecto de Evaluación Clave', editorial:'SM', course: 2 , category: 1},
    {title: 'Ciencias Sociales 3°básico - Saber Hacer', editorial:'Santillana', course: 2 , category: 1},
    {title: 'Diccionario de significados Aristos Junior', course: 2 , category: 1},
    {title: 'American Tiger Student book 2', editorial:'Mc Millan', course: 2 , category: 1},
    {title: 'Lectópolis Comprensión Lectora D', editorial:'Santillana', course: 3 , category: 1},
    {title: 'Cuaderno de Actividades 4°básico', editorial:'Sopena', course: 3 , category: 1},
    {title: 'Diccionario de significados Aristos Junior', course: 3 , category: 1},
    {title: 'Sendas Matemática 4°básico - Proyecto Evaluación Clave', editorial:'SM', course: 3 , category: 1},
    {title: 'Cs. Sociales 4° básico - Serie Saber Hacer', editorial:'Santillana', course: 3 , category: 1},
    {title: 'American Tiger Student book 3', editorial:'Mc Millan', course: 3 , category: 1},
    {title: 'Lectópolis Comprensión Lectora E', editorial:'Santillana', course: 4 , category: 1},
    {title: 'Diccionario de significados Aristos Junior', course: 4 , category: 1},
    {title: 'Cs. Sociales 5° básico - Serie Saber Hacer', editorial:'Santillana', course: 4 , category: 1},
    {title: 'American Think Starter Combo A', editorial:'Cambridge', course: 4 , category: 1},
    {title: 'Lectópolis - Comprensión Lectora F', editorial:'Santillana', course: 5 , category: 1},
    {title: 'Diccionario de significados', editorial:'Aristos', course: 5 , category: 1},
    {title: 'Cs. Sociales 6° básico - Serie Saber Hacer', editorial:'Santillana', course: 5, category: 1},
    {title: 'American Think Starter Combo B', editorial:'Cambridge', course: 5, category: 1},
    {title: 'Lectópolis - Comprensión Lectora G', editorial:'Santillana', course: 6, category: 1},
    {title: 'Cs. Sociales 7° básico - Serie Saber Hacer', editorial:'Santillana', course: 6, category: 1},
    {title: 'American Think Starter Combo B', editorial:'Cambridge', course: 6, category: 1},
    {title: 'Lenguaje y Literatura 8°básico - Proyecto Savia', editorial:'SM', course: 7, category: 1},
    {title: 'American Think Combo 1A', editorial:'Cambridge', course: 7, category: 1},
    {title: 'Cs. Sociales 8° básico - Serie Saber Hacer', editorial:'Santillana', course: 7, category: 1},
    {title: 'Atlas Universal y de Chile regionalizado', editorial:'Zig-Zag', course: 7, category: 1},
    {title: 'American Think Combo 1B', editorial:'Cambridge', course: 8, category: 1},
    {title: 'Atlas Universal y de Chile regionalizado', editorial:'Zig-Zag', course: 8, category: 1},
    {title: 'American Think Combo 2A', editorial:'Cambridge', course: 9, category: 1},
    {title: 'Atlas Universal y de Chile regionalizado', editorial:'Zig-Zag', course: 9, category: 1},
    {title: 'American Think Combo 2B', editorial:'Cambridge', course: 10, category: 1},
    {title: 'Atlas Universal y de Chile regionalizado', editorial:'Zig-Zag', course: 10, category: 1},
    {title: 'American Think Combo 3A', editorial:'Cambridge', course: 11, category: 1},
    {title: 'Atlas Universal y de Chile regionalizado', editorial:'Zig-Zag', course: 11, category: 1}
]


Book.destroy_all

12.times do |i|
    10.times do
        book = Book.create(
            title: Faker::Book.title,
            author: Faker::Book.author,
            editorial: editorials.sample,
            course: i,
            category: 0
        )
        book.image.attach(io: File.open("app/assets/images/book.jpg"), filename: "book.jpg")
        puts "se ha creado el libro #{book.title}, para el curso #{book.course}, en la categoría #{book.category}"
    end
end


texts.each do |text|
    book = Book.create(
        title: text[:title],
        editorial: text[:editorial],
        course: text[:course],
        category: text[:category]
    )
    book.image.attach(io: File.open("app/assets/images/study_text.jpg"), filename: "study_text.jpg")

    puts "se ha creado el libro #{book.title}, para el curso #{book.course}, en la categoría #{book.category}"
end