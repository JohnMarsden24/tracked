require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

puts "Creating Terry..."

User.create!(display_name: "Terry", email: "terry@email.com", password: "password")

puts "Terry created!"

puts "Creating some deliveries..."

Delivery.create!(user_id: 1, tracking_number: "QQ8265464564332", name: "Omega auctions", courier: "Yodel", courier_slug: "yodel", status: "Delivered", expected_arrival_date: "2020-03-08", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "15501861801992", name: "Drums for Jamie", courier: "DPD", courier_slug: "dpd-uk", status: "Delivered", expected_arrival_date: "2020-03-09", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "UBX15501869", name: "Les Gibson 60th year", courier: "Fedex", courier_slug: "fedex-uk", status: "Delivered", expected_arrival_date: "2020-03-04", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "QQ81892344897", name: "Beatles vinyl", courier: "Yodel", courier_slug: "yodel", status: "Delivered", expected_arrival_date: "2020-03-11", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "390971733217", name: "Bass drum for Jan", courier: "FedEx", courier_slug: "fedex-uk", status: "On its way", expected_arrival_date: "2020-03-14", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "JJD0003449497312251", name: "Vinyl collection from Hatfield", courier: "Yodel", courier_slug: "yodel", status: "On its way", expected_arrival_date: "2020-03-14", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "JJD000344949dfdf", name: "Elvis signed photo", courier: "UK Mail", courier_slug: "uk-mail", status: "Delayed", expected_arrival_date: "2020-03-15", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "JJD34234dfdf", name: "Hendrix vinyl", courier: "UK Mail", courier_slug: "uk-mail", status: "Delayed", expected_arrival_date: "2020-03-15", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "EK581737083GB", name: "Microphone preamp", courier: "Parcel Force", courier_slug: "parcel-force", status: "On its way", expected_arrival_date: "2020-03-15", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "391018237497", name: "Sandberg Basic 4string", courier: "FedEx", courier_slug: "fedex-uk", status: "On its way", expected_arrival_date: "2020-03-14", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "1910761065", name: "Pioneer Rx2", courier: "DPD", courier_slug: "dpd-uk", status: "On its way", expected_arrival_date: "2020-03-15", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "750865905", name: "Custom Cymbal Box Set", courier: "TNT", courier_slug: "tnt-uk", status: "Delayed", expected_arrival_date: "2020-03-11", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "1910761767065", name: "Sennheiser HD25", courier: "DPD", courier_slug: "dpd-uk", status: "Delayed", expected_arrival_date: "2020-03-10", delivered: false, fake: true)
Delivery.create!(user_id: 1, tracking_number: "JD0002248646782543", name: "Keyboard pedals", courier: "TNT", courier_slug: "tnt-uk", status: "Delivered", expected_arrival_date: "2020-03-05", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "0513690251554880", name: "Fender Jim Root Jazzmaster", courier: "Parcel Force", courier_slug: "parcel-force", status: "Delivered", expected_arrival_date: "2020-03-06", delivered: true, fake: true)
Delivery.create!(user_id: 1, tracking_number: "GGS1827381723", name: "Accordion piano", courier: "Royal Mail", courier_slug: "royal-mail", status: "Delivered", expected_arrival_date: "2020-03-06", delivered: true, fake: true)


puts "Deliveries created!"

puts "Generating delivery history..."

puts "Delivered history..."
History.create!(delivery_id: 1, status_updates: [["We've received your order details, and we're expecting your parcel shortly", "abbeyroadmusic.co.uk", "2020-03-06T15:48:00"], ["We have your parcel and it's on its way to you", "Yodel", "2020-03-06T16:58:17"], ["Your parcel is at our depot", "Croydon Depot", "2020-03-07T03:51:48"], ["Your parcel will be with you today", "Croydon Depot", "2020-03-09T08:54:20"], ["Your parcel has been delivered and signed for by HONEY", "Yodel", "2020-03-09T11:05:29"]])
History.create!(delivery_id: 2, status_updates: [["We have your order details and will be processing your parcel shortly", "United Kingdom", "2020-03-11T08:15:00"], ["We have your parcel and it's on its way to you", "FedEx", "2020-03-12T16:32:17"], ["Your parcel will be with you today", "FedEx", "2020-03-13T08:54:20"]])
History.create!(delivery_id: 3, status_updates: [["We've received your order details, and we're expecting your parcel shortly", "CurrysPCW", "2020-03-02T21:19:00"], ["We've received your order details, but have not yet received your parcel", "CurrysPCW", "2020-03-02T21:19:00"], ["We have your parcel, and it's on its way to our depot", "FedEx", "2020-03-03T01:45:11"], ["Sorted by distribution centre", "Athlone", "2020-03-03T23:29:33"], ["Out for delivery", "Galway", "2020-03-04T07:59:39"], ["Delivered , signed for by TCREWS", "London", "2020-03-04T13:52:17"]])
History.create!(delivery_id: 4, status_updates: [["Your parcel will be with us soon", "GBR", "2020-03-10T00:00:00"], ["Your parcel is at our sort centre", "Hatfield Terminal", "2020-03-10T19:09:00"], ["Your parcel is in transit", "GBR", "2020-03-10T20:12:00"], ["Your parcel has arrived at your local depot", "Waltham Cross Service Centre", "2020-03-11T00:18:00"], ["Your parcel has been delivered", "GBR", "2020-03-12T08:39:00"]])
History.create!(delivery_id: 7, status_updates: [["Your parcel has been collected", "United Kingdom", "2020-03-10T00:00:00"], ["Your parcel is at the delivery depot", "United Kingdom", "2020-03-12T19:09:00"], ["We weren't able to delvier today", "GBR", "2020-03-13T20:12:00"]])
History.create!(delivery_id: 8, status_updates: [["Your parcel has been collected", "United Kingdom", "2020-03-10T00:00:00"], ["Your parcel is at the delivery depot", "United Kingdom", "2020-03-12T19:09:00"], ["We weren't able to delvier today", "GBR", "2020-03-13T20:12:00"]])
History.create!(delivery_id: 12, status_updates: [["Shipment arrived at connection point", "United Kingdom", "2020-03-10T00:00:00"], ["Your parcel is at the delivery depot", "United Kingdom", "2020-03-12T19:09:00"], ["We weren't able to delvier today", "GBR", "2020-03-13T20:12:00"]])
History.create!(delivery_id: 13, status_updates: [["We have your order details and will be processing your parcel shortly", "United Kingdom", "2020-03-10T00:00:00"], ["Shipment being processed at TNT location.", "Settala Intl Road Hub", "2020-03-12T19:09:00"], ["There's been a delay but we're working hard to deliver on time", "GBR", "2020-03-13T20:12:00"]])
History.create!(delivery_id: 14, status_updates: [["We've received your order details, and we're expecting your parcel shortly", "Piacenza", "2020-03-06T15:48:00"], ["We have your parcel and it's on its way to you", "TNT", "2020-03-06T16:58:17"], ["Your parcel is at our depot", "London Depot", "2020-03-07T03:51:48"], ["Your parcel will be with you today", "South West London Depot", "2020-03-09T08:54:20"], ["Your parcel has been delivered and signed for by HONEY", "TNT", "2020-03-09T11:05:29"]])
History.create!(delivery_id: 15, status_updates: [["Left FedEx origin facility", "abbeyroadmusic.co.uk", "2020-03-06T15:48:00"], ["We have your parcel and it's on its way to you", "Parcel Force", "2020-03-06T16:58:17"], ["Your parcel is at our depot", "London Depot", "2020-03-07T03:51:48"], ["Your parcel will be with you today", "London Depot", "2020-03-09T08:54:20"], ["Your parcel has been delivered and signed for by TERRY", "Parcel Force", "2020-03-09T11:05:29"]])
History.create!(delivery_id: 16, status_updates: [["Left Royal Mail origin facility", "hoxtonmusic.co.uk", "2020-03-06T15:48:00"], ["We have your parcel and it's on its way to you", "Royal Mail", "2020-03-06T16:58:17"], ["Your parcel is at our depot", "South London Depot", "2020-03-07T03:51:48"], ["Your parcel will be with you today", "South London Depot", "2020-03-09T08:54:20"], ["Your parcel has been delivered and signed for by TERRY", "Royal Mail", "2020-03-09T11:05:29"]])

puts "Pending history..."
History.create!(delivery_id: 5, status_updates: [["Your parcel will be with us soon", "GBR", "2020-03-10T00:00:00"], ["Your parcel is at our sort centre", "Hatfield Terminal", "2020-03-10T19:09:00"], ["Your parcel is in transit", "GBR", "2020-03-10T20:12:00"], ["Your parcel has arrived at your local depot", "Waltham Cross Service Centre", "2020-03-11T00:18:00"], ["Sorry we couldn't deliver to you today. Check back here for updates", "GBR", "2020-03-13T08:39:00"]])
History.create!(delivery_id: 6, status_updates: [["Info received", "Yodel", "2020-03-06T00:00:00"], ["Shipment collected from collection address", "Swansea", "2020-03-06T18:29:50+00:00"], ["Shipment in transit", "Swansea", "2020-03-06T18:32:05+00:00"], ["Shipment is out for delivery.", "Howden", "2020-03-09T07:09:33+00:00"]])
History.create!(delivery_id: 9, status_updates: [["Tracked in destination country", "France", "2020-03-06T00:00:00"], ["Exported from the UK", "International Hub", "2020-03-06T18:29:50+00:00"], ["Sorted for export", "International Hub", "2020-03-06T18:32:05+00:00"], ["On route to hub", "London South West Depot", "2020-03-09T07:09:33+00:00"]])
History.create!(delivery_id: 10, status_updates: [["Info received", "Fedex", "2020-03-06T00:00:00"], ["In transit", "KATOWICE PL, United Kingdom", "2020-03-06T18:29:50+00:00"], ["Left FedEx origin facility", "Hub", "2020-03-06T18:32:05+00:00"], ["Shipment information sent to FedEx", "United Kingdom", "2020-03-09T07:09:33+00:00"]])
History.create!(delivery_id: 11, status_updates: [["Info received", "DPD", "2020-03-06T00:00:00"], ["Your parcel has left the United Kingdom and is on its way to Belgium", "DPD", "2020-03-06T18:29:50+00:00"], ["We have your parcel, and it's on its way to our depot", "DPD UK", "2020-03-06T18:32:05+00:00"], ["We've received your order details, and we're expecting your parcel shortly", "DPD UK", "2020-03-09T07:09:33+00:00"]])


puts "History created!"


puts "Adding tags..."

Tag.create!(name: "collected", delivery_id: "1")
Tag.create!(name: "collected", delivery_id: "2")
Tag.create!(name: "Returned - scratched", delivery_id: "4")
Tag.create!(name: "guitar", delivery_id: "10")
Tag.create!(name: "DJ", delivery_id: "11")
Tag.create!(name: "Amy", delivery_id: "12")
Tag.create!(name: "headphones", delivery_id: "13")
Tag.create!(name: "electric", delivery_id: "15")


puts "Tags created!"


