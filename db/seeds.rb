# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  person = Person.create({name: FFaker::Name.name, found_date_time: FFaker::Time.datetime})
  site = Site.create({name: FFaker::Internet.domain_name})
  url = Page.create({url: FFaker::Internet.http_url})
end