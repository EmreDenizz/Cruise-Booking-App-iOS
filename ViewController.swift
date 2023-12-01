//
//  ViewController.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-12-01
//  @description iOS Project - Milestone 4
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import UIKit

class SlashScreenController: UIViewController {
    
    // Database objects
    var db = CruiseDBManager()
    var cruises = Array<Cruise>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add cruises to DB.cruises table once
        db.insertCruise(id: 1, name: "The Bahamas", price: 400)
        db.insertCruise(id: 2, name: "Santorini", price: 500)
        db.insertCruise(id: 3, name: "Kauai Maui", price: 600)
        db.insertCruise(id: 4, name: "The Maldives", price: 700)
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

}
