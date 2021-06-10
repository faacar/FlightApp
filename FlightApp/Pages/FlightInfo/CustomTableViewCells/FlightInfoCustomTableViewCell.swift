//
//  FlightInfoCustomTableViewCell.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import UIKit

class FlightInfoCustomTableViewCell: UITableViewCell {

    static let identifier = "FlightInfoCustomTableViewCell"
    
    @IBOutlet weak var lblAirlineName: UILabel!
    @IBOutlet weak var lblDepartureEstimated: UILabel!
    @IBOutlet weak var lblArrivalEstimated: UILabel!
    @IBOutlet weak var imgFlightStatus: UIImageView!
    @IBOutlet weak var lblDepartureDelay: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(dataModel: FlightDataModel) {
        lblAirlineName.text = dataModel.airline?.name
        lblDepartureEstimated.text = dataModel.departure?.estimated?.formatDate()
        lblArrivalEstimated.text = dataModel.arrival?.estimated?.formatDate()
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
        case .none:
            imgFlightStatus.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
