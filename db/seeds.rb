# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.delete_all
Role.create(name: 'admin')
Role.create(name: 'moderator')
Role.create(name: 'user')

User.delete_all
3.times do |i|
	a = User.new
	i = i.to_s
	a.name = 'qwe'+i; a.email = 'qwe@qwe.qwe'+i; a.password ='qwe'
	a.save
end

r = Role.find_by_name('admin')
r.users << User.first
r = Role.find_by_name('moderator')
r.users << User.find(User.first.id+1)
r = Role.find_by_name('user')
r.users << User.last

r.save

# Add Pseudo Artikles
Article.delete_all
3.times do 
Article.create(title: Faker::Company.bs, content: Faker::Lorem.paragraphs(rand(1..5)).join('<br />').html_safe, user_id: User.first.id)
end
