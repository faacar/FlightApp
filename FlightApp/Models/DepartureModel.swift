//
//  DepartureModel.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

struct DepartureModel: Codable {
    var airport: String?
    var icao: String?
    var estimated: String?
    var delay: Int?
    var terminal: String?
    var gate: String?
}
