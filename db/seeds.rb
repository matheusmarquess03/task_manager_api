5.times do
    Task.create({
     title: Faker::Book.title,
     description: Faker::Lorem.sentence,
     status: Faker::Boolean.boolean,
     visibility: Faker::Boolean.boolean   
    })
end