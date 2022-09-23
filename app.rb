require './lib/oyster_card'
require './lib/trip'
require './lib/constants'

class App
  def start_trip(card)
    card.debit Constants::MAXIMUM_FARE
  end

  def end_trip(card, trip)
    fare = calculate_fare(trip)
    return if fare == Constants::MAXIMUM_FARE

    card.void_last_charge
    card.debit fare
  end

  private

  def calculate_fare(trip)
    return Constants::FARES[:bus] if trip.is_bus

    z1 = Constants::STATION_ZONES.fetch(trip.from)
    z2 = Constants::STATION_ZONES.fetch(trip.to)
    same_zone = z1 & z2

    # check if traveling inside the same zone, like from Earl's Court to Hammersmith or Holburn to Earl's Court
    if same_zone.size > 0
      Constants::PRICE_MAP.fetch(same_zone)
    else # traveling outside a single zone
      # create cartesian product of sets z1 x z2 and return the smallest fare
      paths = z1.product(z2)
      fares = paths.map { |t| Constants::PRICE_MAP.fetch(t) }
      fares.min
    end
  end
end
