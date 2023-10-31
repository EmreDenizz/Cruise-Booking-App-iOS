//
//  LoginViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Emre Deniz on 2023-10-27.
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-10-30
//  @description iOS Project - Milestone 2

// Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
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
