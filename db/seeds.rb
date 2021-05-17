# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "admin@demo.com", password: 'demo1234', password_confirmation: 'demo1234', role: 1)
client = User.create(email: "client@demo.com", password: 'demo1234', password_confirmation: 'demo1234', role: 0)

portfolio = Portfolio.create(user: client, investmented: 1_000_000)

companies = ["IBM", "I01.FRK", "I10.FRK", "I1M.FRK", "I25.FRK", "I3B.FRK", "I3E.LON", "I3F.FRK", "I2X2.FRK", "I3A1.FRK",
 "B.TRV", "B0R.FRK", "B11.FRK", "B12.FRK", "B1C.FRK", "B1F.FRK", "B1N.FRK", "B003.FRK", "B15A.FRK", "T.TRT",
 "T0P.FRK", "T18.FRK", "T1A.FRK", "T1I.FRK", "T1L.FRK", "T1KC.FRK", "T1L.DEX", "T1EU.DEX", "M.TRV", "G02.FRK",
 "M01.FRK", "M04.FRK", "M05.FRK", "M07.FRK", "M09.FRK", "M11.FRK", "M0Y.DEX", "M12.DEX", "G03.FRK", "G08.FRK"]

companies.each do |company|
  Company.create(portfolios: [portfolio], name: company)
end

