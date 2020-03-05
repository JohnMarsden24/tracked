require 'easypost'

EasyPost.api_key = "EZAKddbf320e2710454a8bcaf92457322c43XQ7RAPvK0Jj1xPtkVMLoFA"

tracker = EasyPost::Tracker.create({
  tracking_code: "1840908483",
  carrier: "DPD-UK"
})

# puts tracker.carrier

# carrier_types = EasyPost::CarrierAccount.types

# puts carrier_types
