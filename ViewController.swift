//
//  ViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
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
