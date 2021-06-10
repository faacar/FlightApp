//
//  FlightDetailViewController.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import UIKit

final class FlightDetailViewController: UIViewController {
    
//MARK: - Properties
    @IBOutlet weak private var lblFlightDetails: UILabel!
    
    @IBOutlet weak private var lblDepartureCode: UILabel!
    @IBOutlet weak private var lblArrivalCode: UILabel!
    @IBOutlet weak private var lblDepartureAirportName: UILabel!
    @IBOutlet weak private var lblArrivalAirportName: UILabel!
    
    @IBOutlet weak private var lblDepartureDate: UILabel!
    @IBOutlet weak private var lblDepartureTime: UILabel!
    @IBOutlet weak private var lblArrivalDate: UILabel!
    @IBOutlet weak private var lblArrivalTime: UILabel!
    
    @IBOutlet weak private var lblFlightInfo: UILabel!
    @IBOutlet weak private var lblTerminalInfo: UILabel!
    @IBOutlet weak private var lblGateInfo: UILabel!
    @IBOutlet weak private var lblDelayInfo: UILabel!
    
    var flightDetail: FlightDataModel?

//MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureFlightDetail()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
//MARK: - Functions
    private func configureFlightDetail() {
        lblFlightDetails.text = "\(flightDetail?.flight?.number ?? "Unknown") Flight Details"
        
        lblDepartureCode.text = flightDetail?.departure?.icao
        lblArrivalCode.text = flightDetail?.arrival?.icao
        lblDepartureAirportName.text = flightDetail?.departure?.airport
        lblArrivalAirportName.text = flightDetail?.arrival?.airport
        
        lblDepartureDate.text = flightDetail?.departure?.estimated?.formatDate(type: .dayMonth)
        lblDepartureTime.text = flightDetail?.departure?.estimated?.formatDate(type: .hourEN)
        lblArrivalDate.text = flightDetail?.arrival?.estimated?.formatDate(type: .dayMonth)
        lblArrivalTime.text = flightDetail?.arrival?.estimated?.formatDate(type: .hourEN)
        
        lblFlightInfo.text = flightDetail?.flight?.number
        lblTerminalInfo.text = flightDetail?.departure?.terminal
        lblGateInfo.text = flightDetail?.departure?.gate
        lblDelayInfo.text = String(flightDetail?.departure?.delay ?? 0)
    }
    
    
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureNavigationBar() {
        //navigationItem.back
        navigationController?.navigationItem.backButtonDisplayMode = .default
    }
}
