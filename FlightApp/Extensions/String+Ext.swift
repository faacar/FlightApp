//
//  String+Ext.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

extension String {
    
    func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // ISO 8601
        let dateFormatterSend = DateFormatter()
        dateFormatterSend.dateFormat = "HH:mm"
        
        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterSend.string(from: date)
        } else {
            return "N/A"
        }
    }
}
