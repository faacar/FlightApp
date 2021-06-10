//
//  FlightDataModel.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

struct FlightDataModel: Codable {
    var flightStatus: FlightStatusModel?
    var departure: DepartureModel?
    var arrival: ArrivalModel?
    var airline: AirlineModel?
    var flight: FlightModel?
    
    enum CodingKeys: String, CodingKey {
        case flightStatus = "flight_status"
        case departure = "departure"
        case arrival = "arrival"
        case airline = "airline"
        case flight = "flight"
    }
}
