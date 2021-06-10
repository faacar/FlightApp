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
    @IBOutlet weak private var btnRememberMe: UIButton!    
    @IBOutlet weak private var btnLogin: UIButton! {
        didSet {
            btnLogin.clipsToBounds = true
            btnLogin.layer.cornerRadius = 8.0
        }
    }
    
    var isRememberMeButtonClicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func loginUser() {
        let email = tfEmail.text
        let password = tfPassword.text
        //appcent@appcent.mobi -- 123456
        if email == "a" && password == "a" {
            if isRememberMeButtonClicked {
                saveUser()
            }
            showFlightInfoPage()
        } else {
            presentAlert(title: "Bilgileriniz hatalıdır", message: "Lütfen bilgilerini kontrol ediniz")
        }
    }
    
    @IBAction func actionRememberMe(_ sender: Any) {
        
        isRememberMeButtonClicked = !isRememberMeButtonClicked
        var btnImage: UIImage?
        if isRememberMeButtonClicked {
            btnImage = FlightAppImages.checkedCheckbox
        } else {
            btnImage = FlightAppImages.checkbox
        }
        btnRememberMe.setImage(btnImage, for: .normal)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        loginUser()
    }
    
    private func showFlightInfoPage() {
        if let destinationVC = UIStoryboard(name: "FlightInfo", bundle: nil).instantiateInitialViewController() as? FlightInfoViewController {
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    private func saveUser() {
        UserDefaults.standard.set(true, forKey: "userLoginData")
    }
    
}

