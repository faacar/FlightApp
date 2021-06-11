//
//  Constants.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation
import UIKit.UIColor

struct Constants {
    static let baseURL = "http://api.aviationstack.com/v1/"
    static let flightSearch = "flights?access_key="
    static let apiKey = "5fd1444ffd085679e9a695ec84a89ef2"
}

struct GradientColors {
    static let navigationBarBlue1 = UIColor(named: "navigationBarGradient1")
    static let navigationBarBlue2 = UIColor(named: "navigationBarGradient2")
}

struct FlightStatusImage {
    static let active = UIImage(named: "statusGreen")
    static let cancelled = UIImage(named: "statusRed")
    static let scheduled = UIImage(named: "statusYellow")
    static let landed = UIImage(named: "statusOrange")
}

struct FlightAppImages {
    static let checkedCheckbox = UIImage(named: "checkedCheckbox")
    static let checkbox = UIImage(systemName: "square")
    static let signoutButtonImage = UIImage(named: "signout")
}
