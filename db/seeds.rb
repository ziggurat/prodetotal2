# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Competition.create(
  name: "Current test competition",
  start_date: DateTime.now - 1.month,
  end_date: DateTime.now + 1.month,
  logo: "assets/UEFA_Champions_League_logo_2.svg")

Competition.create(
  name: "UEFA Champions League Playoffs 2015",
  start_date: DateTime.parse('2015-02-17'),
  end_date: DateTime.parse('2015-06-06'),
  logo: "assets/UEFA_Champions_League_logo_2.svg")

Competition.create(
  name: "UEFA Euro 2016 - Francia",
  start_date: DateTime.parse('2016-06-10'),
  end_date: DateTime.parse('2016-07-10'),
  logo: "assets/UEFA_Euro_2016_Logo.svg")