//
//  ViewController.swift
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

class SlashScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Login button
    @IBAction func loginButtonAction (_ sender: Any) {
        let control = storyboard?.instantiateViewController(withIdentifier: "login") as!
        LoginViewController
        
        present(control, animated: true)
    }
    
    // Register button
    @IBAction func registerButtonAction (_ sender: Any) {
        let control = storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        
        present(control, animated: true)
    }
    
    // Search button
    @IBAction func searchButtonAction (_ sender: Any) {
        let control = storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
        
        present(control, animated: true)
    }
    
    //Home button
    @IBAction func homeButtonAction (_ sender: Any) {
        let control = storyboard?.instantiateViewController(withIdentifier: "home_view") as! HomeViewController
        
        present(control, animated: true)
    }


}

