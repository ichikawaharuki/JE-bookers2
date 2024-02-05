# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  [
    {
      name: "test",
      email: "a@a",
      password: "aaaaaa",
      age: 10,  # 文字列ではなく整数に修正
      gender: "Male"
    },
    {
      name: "test2",
      email: "b@b",
      password: "aaaaaa",
      age: 20,  # 文字列ではなく整数に修正
      gender: "Female"
    }
  ]
)