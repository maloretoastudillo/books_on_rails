User.destroy_all

users = [ 
    {email:'loreto@book.cl', first_name:'María Loreto', last_name:'Astudillo', password:'123456', admin: true},
    {email:'renata@book.cl', first_name:'Renata', last_name:'Fuentes', password:'123456', admin: false},
    {email:'anita@book.cl', first_name:'Anita', last_name:'González', password:'123456', admin: false},
    {email:'claudia@book.cl', first_name:'Claudia', last_name:'Vásquez', password:'123456', admin: false},
    {email:'majesus@book.cl', first_name:'María Jesús', last_name:'Miranda', password:'123456', admin: false},
    {email:'enrique@book.cl', first_name:'Enrique', last_name:'Tapia', password:'123456', admin: false},
    {email:'martin@book.cl', first_name:'Martín', last_name:'Pinto', password:'123456', admin: false}
]

users.each do |user|
    u = User.create(
        email: user[:email],
        first_name: user[:first_name],
        last_name: user[:last_name],
        password: user[:password],
        encrypted_password: user[:password],
        admin: user[:admin]
    )
    puts "se ha creado el usuario #{u.first_name} #{u.last_name} con email #{u.email}"
end