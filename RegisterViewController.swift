//
//  RegisterViewController.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-11-13
//  @description iOS Project - Milestone 3
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a label descriptions to accept terms programmatically
        let lbl = UILabel(frame: CGRect(x: 100, y: 0, width: 300, height: 21))
        lbl.center = CGPoint(x: 230, y: 590)
        lbl.text = "You are supposed to accept terms."
        self.view.addSubview(lbl)
    }
    
    // Register button
    @IBAction func registerButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        
        present(control, animated: true)
    }
    
    // Cancel button
    @IBAction func cancelButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "home") as! SlashScreenController
        
        present(control, animated: true)
    }
    

}
