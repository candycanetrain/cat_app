# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.create!(name: "Muffins", birth_date: "2011-05-01", color: "black", sex: "M", description: "Douche")
Cat.create!(name: "Tom", birth_date: "1990-06-30", color: "black", sex: "M", description: "Hates Jerry")
Cat.create!(name: "Honey", birth_date: "2013-12-04", color: "calico", sex: "F", description: "What a lovely fella")
Cat.create!(name: "Gilly", birth_date: "1994-02-18", color: "white", sex: "M", description: "Actually a human")

CatRentalRequest.create!(cat_id: 2, start_date: "2017-01-01", end_date: "2017-01-03", status: "APPROVED")
CatRentalRequest.create!(cat_id: 2, start_date: "2017-01-05", end_date: "2017-01-07", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2017-01-04", end_date: "2017-01-05", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2017-01-08", end_date: "2017-01-09", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2017-01-13", end_date: "2017-01-18", status: "PENDING")



# CatRentalRequest.new(cat_id: 2, start_date: "2017-01-02", end_date: "2017-01-15", status: "APPROVED")
# CatRentalRequest.new(cat_id: 2, start_date: "1913-01-02", end_date: "1920-01-15", status: "APPROVED")
