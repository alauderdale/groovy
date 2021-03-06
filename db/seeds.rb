# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

# create Alex
user2 = User.find_or_create_by_email :name => 'Alex LAuderdale', :email => 'alauderdale@mac.com', :password => 'beaker10', :password_confirmation => 'beaker10'
# create Alex
user3 = User.find_or_create_by_email :name => 'John Doe', :email => 'john@doe.com', :password => 'beaker10', :password_confirmation => 'beaker10'
# add some shots
Shot.find_or_create_by_title :title => 'Shot 1', :user_id => user2.id, :description => 'cool man', :audio_file_size => 200
Shot.find_or_create_by_title :title => 'Shot 2', :user_id => user2.id, :description => 'cool man', :audio_file_size => 200
Shot.find_or_create_by_title :title => 'Shot 3', :user_id => user3.id, :description => 'cool man', :audio_file_size => 200
