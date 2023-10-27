//
//  RegisterViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Emre Deniz on 2023-10-27.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Register button
    @IBAction func registerButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
        
        present(control, animated: true)
    }
    
    // Cancel button
    @IBAction func cancelButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        
        present(control, animated: true)
    }
    

}
