//
//  LoginViewController.swift
//  FlightApp
//
//  Created by Ahmet Acar on 9.06.2021.
//

import UIKit


final class LoginViewController: UIViewController {
    

    @IBOutlet weak private var tfEmail: UITextField!
    @IBOutlet weak private var tfPassword: UITextField!
    
    @IBOutlet weak private var btnCheckBox: UIButton!    
    @IBOutlet weak private var btnLogin: UIButton! {
        didSet {
            btnLogin.clipsToBounds = true
            btnLogin.layer.cornerRadius = 8.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loginUser() {
        let email = tfEmail.text
        let password = tfPassword.text
        //appcent@appcent.mobi -- 123456
        if email == "a" && password == "a" {
            showFlightInfoPage()
        } else {
            print("Bilgileriniz hatalidir -- Lutfen bilgilerini kontrol ediniz === ALERT")
        }
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        print("button clicked")
        loginUser()
    }
    
    private func showFlightInfoPage() {
        if let destinationVC = UIStoryboard(name: "FlightInfo", bundle: nil).instantiateInitialViewController() as? FlightInfoViewController {
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
}

