//
//  ViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Emre Deniz on 2023-10-27.
//

import UIKit

class ViewController: UIViewController {

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
    


}

