require('aftership')
AfterShip.api_key = "7beee5c2-ca2b-49c5-a0c8-ee57c0b18434"

number = "390767773272"

# couriers = AfterShip::V4::Courier.get
# AfterShip::V4::Courier.get_all
# couriers = AfterShip::V4::Courier.detect({:tracking_number => number})

# puts couriers

# AfterShip::V4::Tracking.create('1ZA6F598D992381375', {:emails => ['a@abcd.com', 'asdfasdfs@gmail.com']})
puts AfterShip::V4::Tracking.get('fedex-uk', number)
# AfterShip::V4::Tracking.get_all
# AfterShip::V4::Tracking.update('ups', '1ZA6F598D992381375', {:title => 'Testing'})
# AfterShip::V4::Tracking.retrack('ups', '1ZA6F598D992381375')
# AfterShip::V4::Tracking.delete('ups', '1ZA6F598D992381375')

# AfterShip::V4::LastCheckpoint.get('ups', '1ZA6F598D992381375')
