//
//  FlightInfoViewController.swift
//  FlightApp
//
//  Created by Ahmet Acar on 9.06.2021.
//

import UIKit

final class FlightInfoViewController: UIViewController {
    
    lazy var networkManager = NetworkManager()
    var flightDataModel = [FlightDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        networkManager.getFlightInfo { [weak self] (result) in
            self?.flightDataModel = result.data ?? []
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
