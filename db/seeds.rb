# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Competition.create(name: "Copa del Mundo FIFA Brasil 2014", start_date: DateTime.parse('2001-02-03T04:05:06+07:00'), end_date: DateTime.parse('2001-02-03T04:05:06+07:00'), logo: "assets/WC-2014-Brasil.svg")
Competition.create(name: "Copa Libertadores de America 2014", start_date: DateTime.parse('2001-02-03T04:05:06+07:00'), end_date: DateTime.parse('2001-02-03T04:05:06+07:00'), logo: "assets/Copa_Bridgestone_Libertadores_logo.png")
Competition.create(name: "UEFA Champions League", start_date: DateTime.parse('2001-02-03T04:05:06+07:00'), end_date: DateTime.parse('2001-02-03T04:05:06+07:00'), logo: "assets/UEFA_Champions_League_logo_2.svg")
