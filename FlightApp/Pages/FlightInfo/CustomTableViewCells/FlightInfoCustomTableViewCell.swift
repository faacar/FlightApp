//
//  FlightInfoCustomTableViewCell.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import UIKit

final class FlightInfoCustomTableViewCell: UITableViewCell {

//MARK: - Properties
    static let identifier = "FlightInfoCustomTableViewCell"
    
    @IBOutlet weak var lblAirlineName: UILabel!
    @IBOutlet weak var lblDepartureEstimated: UILabel!
    @IBOutlet weak var lblArrivalEstimated: UILabel!
    @IBOutlet weak var imgFlightStatus: UIImageView!
    @IBOutlet weak var lblDepartureDelay: UILabel!
    
//MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Functions
    func configureCell(dataModel: FlightDataModel) {
        let departureInfo = "\(dataModel.departure?.icao ?? "N/A") - \(dataModel.departure?.estimated?.formatDate(type: .hourTR) ?? "N/A")"
        let arrivalInfo = "\(dataModel.arrival?.icao ?? "N/A") - \(dataModel.arrival?.estimated?.formatDate(type: .hourTR) ?? "N/A")"
        lblAirlineName.text = dataModel.airline?.name
        lblDepartureEstimated.text = departureInfo
        lblArrivalEstimated.text = arrivalInfo
        lblDepartureDelay.text = "\(dataModel.departure?.delay ?? 13) mi"
        checkFlightStatus(status: dataModel.flightStatus)
    }
    
    private func checkFlightStatus(status: FlightStatusModel?) {
        switch status {
        case .active:
            imgFlightStatus.image = FlightStatusImage.active
        case .cancelled:
            imgFlightStatus.image = FlightStatusImage.cancelled
        case .scheduled:
            imgFlightStatus.image = FlightStatusImage.scheduled
        case .landed:
            imgFlightStatus.image = FlightStatusImage.landed

        case .none:
            imgFlightStatus.isHidden = true
        }
    }
}
