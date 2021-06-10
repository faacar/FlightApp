//
//  UIViewController+Ext.swift
//  FlightApp
//
//  Created by Ahmet Acar on 10.06.2021.
//

import UIKit

fileprivate var containerView: UIView?

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        
        alertController.addAction(okeyAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
