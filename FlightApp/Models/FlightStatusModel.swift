//
//  FlightStatusModel.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

enum FlightStatusModel: String, Codable {
    case active = "active"
    case cancelled = "cancelled"
    case scheduled = "scheduled"
    case landed = "landed"
}


