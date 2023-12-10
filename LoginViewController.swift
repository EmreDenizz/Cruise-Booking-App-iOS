//
//  LoginViewController.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-12-01
//  @description iOS Project - Final Version
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import UIKit

class LoginViewController: UIViewController {
    
    //Reference to the email text field
    @IBOutlet weak var EmailTextField: UITextField!
    
    //Reference to the password text field
    @IBOutlet weak var PasswordTextField: UITextField!
    
    var cruiseDbManager = CruiseDBManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If there is current user logged in, redirect to Home screen
        let defaults = UserDefaults.standard
        let currentUserEmail = defaults.string(forKey: "currentUserEmail")
        if currentUserEmail != nil{
            let homeView = self.storyboard?.instantiateViewController(identifier: "home_view") as! HomeViewController
            self.navigationController?.pushViewController(homeView, animated: true)
        }
    }
    
    // Login button
    @IBAction func loginButtonAction (_ sender: UIButton) {
        
        //Validate the email and password
        if self.EmailTextField.text!.isEmpty || self.PasswordTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"Email and password are required", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        else {
            if cruiseDbManager.loginUser(email: self.EmailTextField.text!, password: self.PasswordTextField.text!) {
                // Login successful, proceed to the next screen or perform necessary actions
                print("Login successful!")
                
                // save current user email in UserDefaults
                let defaults = UserDefaults.standard
                defaults.removeObject(forKey: "currentUserEmail")
                defaults.set(EmailTextField.text, forKey: "currentUserEmail")
                
                // Goto home page after successful login
                let homeView = self.storyboard?.instantiateViewController(identifier: "home_view") as! HomeViewController
                self.navigationController?.pushViewController(homeView, animated: true)
            }
            else {
               // Login failed
               print("Login failed!")
               let alert = UIAlertController(title: "Invalid Details!",
                   message:"Your email or password is incorrect", preferredStyle: .alert)
               let clearAction = UIAlertAction(title: "Modify", style: .cancel, handler: nil)
               alert.addAction(clearAction)
               present(alert, animated: true, completion: nil)
           }
        }
    }
}
