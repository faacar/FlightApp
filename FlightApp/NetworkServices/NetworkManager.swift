//
//  NetworkManager.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import Foundation

class NetworkManager {
    
    func getFlightInfo(completionHandler: @escaping ((FlightAppResponse) -> Void)) {
        let requestURL = "\(Constants.baseURL)\(Constants.flightSearch)\(Constants.apiKey)"
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
                print("calisiyo")
                DispatchQueue.main.async {
                    print("\(callResult) aaaaa")
                    completionHandler(callResult)
                }
            } catch {
                print("Decode error")
            }
        }.resume()
    }
    
//    func getMovieList(keyword: String, completionHandler: @escaping ((FilmListResponse) -> Void)) {
//        guard let url = URL(string: Constants.baseUrl + Constants.apiKey + Constants.search + keyword) else { return }
//        let session = URLSession.shared
//        session.dataTask(with: u(rl) { data, response, error in
//            if let data = data {
//                let decoder = JSONDecoder()
//                do {
//                    let decodedModel = try decoder.decode(FilmListResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        completionHandler(decodedModel)
//                    }
//                    print("Başarılı")
//                } catch {
//                    print("Hatalı")
//                }
//            } else {
//                print("Response hatalı")
//            }
//        }.resume()
//    }
}
