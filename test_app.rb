require_relative './app'
require 'test/unit'
require 'test/unit/ui/console/testrunner'

class TripTest < Test::Unit::TestCase
  def test_bus_trips
    ## assign
    card = OysterCard.new
    card.credit Constants::FARES[:bus] * 2 # credits for 2 bus trips at 180 per trip

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:holburn, :hammersmith, by_bus: true))

    app.start_trip card
    app.end_trip(card, Trip.new(:hammersmith, :wimbledon, by_bus: true))

    ## assert
    assert_equal(card.balance, 0)
    assert_equal([Constants::FARES[:bus] * 2, -Constants::FARES[:bus], -Constants::FARES[:bus]], card.transaction_history)
  end

  def test_zone_one
    ## assign
    card = OysterCard.new
    card.credit Constants::FARES[:anyzone1]

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:holburn, :chelsea))

    ## assert
    assert_equal(card.balance, 0)
    assert_equal([Constants::FARES[:anyzone1], -Constants::FARES[:anyzone1]], card.transaction_history)
  end

  def test_earlscourt_to_hammersmith
    ## assign
    card = OysterCard.new
    card.credit Constants::FARES[:outsidezone1]

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:earlscourt, :hammersmith))

    ## assert
    assert_equal(card.balance, 0)
    assert_equal([Constants::FARES[:outsidezone1], -Constants::FARES[:outsidezone1]], card.transaction_history)
  end

  def test_any_three_zones
    ## assign
    card = OysterCard.new
    card.credit Constants::FARES[:anythreezones]

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:holburn, :wimbledon))

    ## assert
    assert_equal(card.balance, 0)
    assert_equal([Constants::FARES[:anythreezones], -Constants::FARES[:anythreezones]], card.transaction_history)
  end

  def test_multiple_possible_fares
    ## assign
    card = OysterCard.new
    card.credit Constants::FARES[:twozonesexcludingzone1]

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:earlscourt, :wimbledon))

    ## assert
    assert_equal(card.balance, 0)
    assert_equal([Constants::FARES[:twozonesexcludingzone1], -Constants::FARES[:twozonesexcludingzone1]], card.transaction_history)
  end

  def test_sample_journey
    ## assign
    card = OysterCard.new
    card.credit 3000

    ## act
    app = App.new
    app.start_trip card
    app.end_trip(card, Trip.new(:holburn, :earlscourt))

    app.start_trip card
    app.end_trip(card, Trip.new(:earlscourt, :chelsea, by_bus: true))

    app.start_trip card
    app.end_trip(card, Trip.new(:chelsea, :wimbledon))

    ## assert
    assert_equal(card.balance, 22.5)
    assert_equal([3000, -Constants::FARES[:anyzone1], -Constants::FARES[:bus], -Constants::FARES[:anythreezones]], card.transaction_history)
  end
end
