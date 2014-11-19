Project.delete_all
Task.delete_all
User.delete_all
Membership.delete_all

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234"
  )
end

23.times do
  project = Project.create!(name: Faker::Lorem.word)

  rand(15).times do
    Task.create!(
      project_id: project.id,
      description: Faker::Lorem.word,
      due_date: Faker::Date.forward(23)
    )
  end

  users = User.all.clone
  rand(15).times do
    user = users.sample
    member = Membership.new(
      user_id: user.id,
      project_id: project.id,
      status: ["Member", "Owner"].sample,
    )
    if member.save
    end
  end
end
