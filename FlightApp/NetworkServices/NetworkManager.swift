//
//  NetworkManager.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

final class NetworkManager {
    
    func getFlightInfo(completionHandler: @escaping ((FlightAppResponse) -> Void)) {
        let requestURL = "\(Constants.baseURL)\(Constants.flightSearch)\(Constants.apiKey)"
        //http://api.aviationstack.com/v1/flights?access_key=5fd1444ffd085679e9a695ec84a89ef2
        print(requestURL)
        guard let url = URL(string: requestURL) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data  else {
                print("Data error")
                return
            }
            let decoder = JSONDecoder()
            do {
                let callResult = try decoder.decode(FlightAppResponse.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(callResult)
                }
            } catch {
                print("Decode error")
            }
        }.resume()
    }
}
