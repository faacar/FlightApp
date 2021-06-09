//
//  SplashViewController.swift
//  FlightApp
//
//  Created by Ahmet Acar on 9.06.2021.
//

import UIKit

final class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redirectPage()
    }
    
    
    private func redirectPage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            if self.checkUserLoginStatus() {
                //self.showMainPage()
                self.showLoginPage()

            } else {
                self.showLoginPage()
            }
        })
    }
    
    private func showLoginPage() {
        if let destinationVC = UIStoryboard(name: "LoginPage", bundle: nil).instantiateInitialViewController() as? LoginViewController {
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }

    
    private func checkUserLoginStatus() -> Bool {
        return true
    }
    
}
