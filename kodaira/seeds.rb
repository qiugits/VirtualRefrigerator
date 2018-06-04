# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
CSV.foreach(Rails.root + 'db/nutr_data.csv') do |row|
	Nutririon.create(:item => row[0], :protein => row[1], :lipd => row[2], :carbon => row[3],:vaitamin => row[4], :mineral => row[5])
end
