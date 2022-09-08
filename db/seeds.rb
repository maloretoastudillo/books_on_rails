Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed } if Rails.env.development?

if Rails.env.production?
    AdminUser.create!(email: 'admin@book.com', password: '123456', password_confirmation: '123456')
    User.create(
        email: "user_admin@book.com",
        first_name: "Juan",
        last_name: "Soto",
        password: "123456",
        password_confirmation: "123456",
        admin: true
    )

    puts "los usuarios han sido creados"
end
