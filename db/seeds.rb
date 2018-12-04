# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_by_email('admin@porua.com')
if user.blank?
  puts 'Creating Admin User....'
  user = User.create!(email: 'admin@porua.com', password: '123123123', name: 'admin01' )

  user.remove_role :member if(user.has_role? :member)

  user.add_role :admin
else
  puts 'Admin User already exist and skipping.'
end