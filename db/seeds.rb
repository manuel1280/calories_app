# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = 50
months = 4
days = 30
max_daily_posts = 5

def type_value_helper()
    type=rand(0..1)
    type == 0 ? "won" : "lost"
end

def comment_helper(type)
    if type == "won"
        comment="I ate #{Faker::Food.description}"
    else
        comment="I #{Faker::Verb.past}"
    end
end

def create_user(iteration)
    User.create!(email: "user#{iteration}@ejemplo.com", password: "123456", num_register: iteration)
end

def create_post(month,day,user)
    value = rand (500..1000)
    type = type_value_helper()
    comment = comment_helper(type)
    Calory.create(value: value, type_value: type, comment: comment, user_id: user, created_at: "2019-#{month}-#{day} 19:39:05", updated_at: "2019-#{month}-#{day} 19:39:05")  
end

# main function
for user in (1..users)
    create_user(user)
    for month in (1..months)
        for day in (1..days)
            posts=rand(1..max_daily_posts)
            for post in (1..posts)
                create_post(month,day,user)
            end
        end
    end
end