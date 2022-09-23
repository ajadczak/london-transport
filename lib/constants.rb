module Constants
  STATION_ZONES = {
    holburn: [1],
    chelsea: [1],
    earlscourt: [1, 2],
    hammersmith: [2],
    wimbledon: [3]
  }.freeze

  # Map of [from_zone, to_zone] pairs, plus [from_zone & to_zone] unions for when traveling in the same zone
  PRICE_MAP = {
    [1] => 250, # anywhere in zone 1. Could also be [1] & :earlscourt
    [2] => 200, # any one zone outside zone 1
    [3] => 200, # any one zone outside zone 1
    [1, 2] => 300, # any two zones including zone 1
    [2, 3] => 225, # any two zones excluding zone 1
    [1, 3] => 320 # any three zones
  }.freeze

  FARES = {
    anyzone1: 250,
    outsidezone1: 200,
    twozonesincludingzone1: 300,
    twozonesexcludingzone1: 225,
    anythreezones: 320,
    bus: 180
  }.freeze

  MAXIMUM_FARE = FARES.values.max
end
