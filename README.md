# London Transport Simulation

This repository contains code for a simplified simulation of passenger travel along the London transport system using an Oyster Card. The simulation includes concerns for bus and tube travel, as well as oyster card credits and debits.

## Problem description

A passenger would like to travel from Holburn to Wimbledon. If Holburn is in Zone 1, and Wimbledon is in Zone 3, what is the fare that will be incurred by the passenger traveling from Zone 1 to Zone 3? What is the fare if this passenger would instead travel by bus?

Additionally, the system should account for a passenger which starts a journey but does not finish by tapping their oyster card at the exit. In this case, the passenger is charged the maximum fare.

---


## How to run

### Sample journey

The sample journey below can be executed by running `ruby sample_journey.rb` from the root of the repository.

- Tube Holburn to Earl's Court
- 328 bus from Earl's Court to Chelsea
- Tube Chelsea to Wimbledon

### Unit Tests

To execute the unit tests use: `ruby test_app.rb`

---


## Data Tables

The data tables below define the stations, zone, and fares used to calculate a journey.

### Stations and Zones

| Station | Zone |
|---|---|
| Holburn  |  1 |
| Chelsea | 1
| Earl's Court | 1, 2|
| Hammersmith | 2 |
| Wimbledon | 3 |

### Fares

| Journey | Fare |
|---|---|
| Anywhere in Zone 1 | £2.50 |
| Any one zone outside Zone 1| £2.00 |
| Any two zones including Zone 1 | £3.00 |
| Any two zones excluding Zone 1 | £2.25 |
| Any three zones | £3.20 |
| Any bus journey | £1.80 |

Maximum fare: £3.20