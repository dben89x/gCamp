Project.delete_all
23.times do
  project = Project.create!(name: Faker::Lorem.word)
  rand(15).times do
    Task.create!(
      project_id: project.id,
      description: Faker::Lorem.word,
      due_date: Faker::Date.forward(23)
    )
  end
end
