//
//  String+Ext.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

extension String {
    
    enum DateConvertType: String {
        case hourTR = "HH:mm"
        case hourEN = "HH:mm a"
        case dayMonth = "E, MMM dd"
    }
    
    func formatDate(type: DateConvertType) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // ISO 8601
        let dateFormatterSend = DateFormatter()
        dateFormatterSend.dateFormat = type.rawValue
        
        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterSend.string(from: date)
        } else {
            return "N/A"
        }
    }
}
