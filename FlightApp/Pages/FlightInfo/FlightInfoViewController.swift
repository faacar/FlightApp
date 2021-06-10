//
//  FlightInfoViewController.swift
//  FlightApp
//
//  Created by Ahmet Acar on 9.06.2021.
//

import UIKit

final class FlightInfoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var networkManager = NetworkManager()
    var flightDataModel = [FlightDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        networkManager.getFlightInfo { [weak self] (result) in
            self?.flightDataModel = result.data ?? []
            self?.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: FlightInfoCustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FlightInfoCustomTableViewCell.identifier)
    }
    
    private func configureNavigationBar() {
        title = "Flight"
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        let gradientLayer = CAGradientLayer()
        var updatedFrame = self.navigationController!.navigationBar.bounds
        updatedFrame.size.height += UIStatusBarManager.accessibilityFrame().size.height
        gradientLayer.frame = updatedFrame
        gradientLayer.colors = [GradientColors.navigationBarBlue1?.cgColor ?? UIColor.blue.cgColor, GradientColors.navigationBarBlue2?.cgColor ?? UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }

}

extension FlightInfoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let flightInfo = flightDataModel[indexPath.row]
        if let destinationVC = UIStoryboard(name: "FlightDetail", bundle: nil).instantiateInitialViewController() as? FlightDetailViewController {
            destinationVC.flightDetail = flightInfo
            let navigationVC = UINavigationController(rootViewController: destinationVC)
            present(navigationVC, animated: true, completion: nil)
        }
    }
}

extension FlightInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlightInfoCustomTableViewCell.identifier, for: indexPath) as? FlightInfoCustomTableViewCell {
            let flightInfo = flightDataModel[indexPath.row]
            cell.configureCell(dataModel: flightInfo)
            return cell
        }
        return UITableViewCell()
    }
    
    
}
