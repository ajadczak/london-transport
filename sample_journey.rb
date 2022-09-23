#!/usr/bin/env ruby

require_relative './app'

# Create a new oyster card and loads it with 30.00
card = OysterCard.new
card.credit 3000

# Take some trips
app = App.new
app.start_trip card
app.end_trip(card, Trip.new(:holburn, :earlscourt))

app.start_trip card
app.end_trip(card, Trip.new(:earlscourt, :chelsea, by_bus: true))

app.start_trip card
app.end_trip(card, Trip.new(:chelsea, :wimbledon))

puts 'Transaction history: '
card.transaction_history.each { |t| puts '%0.2f ' % (t.to_f / 100) }
puts 'Card has a remaining balance of £%0.2f' % card.balance
