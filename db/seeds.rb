# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = 2
months = 1
days = 3
max_daily_posts = 4


def type_value_helper()
    type=rand(0..1)
    type == 0 ? "won" : "lost"
end

def comment_helper(type)
    type == "won" ? "I ate #{Faker::Food.description}" : "I #{Faker::Verb.past}"
end

def create_user(user_i)
    User.create!(email: "user#{user_i}@ejemplo.com", password: "123456")
end


def update_user(user_id)
    total_post = Calory.where("user_id = #{user_id}").count
    user = User.find(user_id)
    user.update(num_register: total_post)
end

def create_post(month,day,user)
    value = rand (500..1000)
    type = type_value_helper()
    comment = comment_helper(type)
    Calory.create(
        value: value, 
        type_value: type, 
        comment: comment, 
        user_id: user, 
        created_at: "2019-#{month}-#{day} 19:39:05 -0500", 
        updated_at: "2019-#{month}-#{day} 19:39:05 -0500")
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

for user in (1..users)
    update_user(user)
end