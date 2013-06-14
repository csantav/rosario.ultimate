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


Page.delete_all
Page.create(name: 'about us', header: Faker::Lorem.paragraphs(1).join('<br />').html_safe, content: Faker::Lorem.paragraphs(rand(3..5)).join('<br />').html_safe)
Page.create(name: 'training', header: Faker::Lorem.paragraphs(1).join('<br />').html_safe, content: Faker::Lorem.paragraphs(rand(3..5)).join('<br />').html_safe)




a = "			<h2>H2: Lorem ipsum dolor sit amet</h2>"\
"				"\
"				<p>Eget nunc orci turpis minim sed vel. Volutpat urna sit tellus"\
"					sapien. Quis aliquet viverra mi tristique elit cumque, eu blandit"\
"					magna, integer sed metus id leo congue fusce.</p>"\
"				<p>"\
"					Dapiensociis <a href='#''>temper donec auctortortis cumsan</a> et"\
"					curabitur condis lorem loborttis leo. Ipsumcommodo libero nunc at"\
"					in velis tincidunt pellentum tincidunt vel lorem."\
"				</p>"\
"				<p>"\
"					Temperinte interdum sempus odio urna eget curabitur semper"\
"					convallis nunc laoreet. Nullain convallis ris <a href='#'><strong>elis"\
"							vest liberos nis diculis</strong></a> feugiat in rutrum."\
"					Suspendreristibulumfaucibulum lobortor quis tortortor ris sapien"\
"					sce enim et volutpat sus."\
"				</p>"\
"				<br>"\
"				<h3>H3: Lorem ipsum dolor sit amet</h3>"\
"				<p>"\
"					Urnaretiumorci orci <strong>fauctor leo justo nulla cras"\
"						ridiculum</strong> eu id vitae. Etnon et dolor auctor eu loreet fring"\
"					temper pend pede integestibus."\
"				</p>"\
"				<p>Portortornec condimenterdum eget consectetuer condis"\
"					consequam pretium pellus sed mauris enim. Puruselit mauris nulla"\
"					hendimentesque elit semper nam a sapien urna sempus.</p>"\
"				<br />"

Page.create(name: 'find us', header: Faker::Lorem.paragraphs(1).join('<br />').html_safe, content: a.html_safe)







