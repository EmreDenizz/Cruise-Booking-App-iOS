//
//  LoginViewController.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-11-27
//  @description iOS Project - Milestone 4
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

        // Do any additional setup after loading the view.
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
                let alert = UIAlertController(title: "Login Success",
                    message:"Your details have been authenticated", preferredStyle: .alert)
                
                let proceedAction = UIAlertAction(title: "Proceed", style: .cancel) { [weak self] _ in
                    // Instantiate the home view
                    let homeView = self?.storyboard?.instantiateViewController(identifier: "home_view") as! HomeViewController
                    self?.navigationController?.pushViewController(homeView, animated: true)
                }

                alert.addAction(proceedAction)

                present(alert, animated: true, completion: nil)

               } else {
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
