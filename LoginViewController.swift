//
//  LoginViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Emre Deniz on 2023-10-27.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Login button
    @IBAction func loginButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
        
        present(control, animated: true)
    }
    
    // Cancel button
    @IBAction func cancelButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "home") as! SlashScreenController
        
        present(control, animated: true)
    }
    


}
