require "httparty"
require "aftership"

# def get_tracking(tracking_id)
#   HTTParty.get("https://api.aftership.com/v4/trackings/#{tracking_id}",
#     headers: {
#       "aftership-api-key" => "7beee5c2-ca2b-49c5-a0c8-ee57c0b18434",
#       "Content-Type" => "application/json"
#     }
#   )
# end

# id = "o9o1ssrx26mnsk7i32eei015"

# puts get_tracking(id)

AfterShip.api_key = "7beee5c2-ca2b-49c5-a0c8-ee57c0b18434"

p AfterShip::V4::Tracking.get('dpd-uk', '1861371825')

