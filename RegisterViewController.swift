//
//  RegisterViewController.swift
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

class RegisterViewController: UIViewController {
    
    //Reference to the first name text field
    @IBOutlet weak var FirstNamextField: UITextField!
    
    //Reference to the last name text field
    @IBOutlet weak var LastNameTextField: UITextField!
    
    //Reference to the email text field
    @IBOutlet weak var EmailTextField: UITextField!
    
    //Reference to the terms and conditions switch
    @IBOutlet weak var TermsAndConditionSwitch: UISwitch!
    
    //Reference to the password text field
    @IBOutlet weak var PasswordTextField: UITextField!
    
    var cruiseDbManager = CruiseDBManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a label descriptions to accept terms programmatically
        let lbl = UILabel(frame: CGRect(x: 100, y: 0, width: 300, height: 21))
        lbl.center = CGPoint(x: 230, y: 590)
        lbl.text = "You are supposed to accept terms."
        self.view.addSubview(lbl)
    }
    
    //Event handler for the terms and conditions switch
    @IBAction func onSwitchChanged(_ sender: UISwitch) { //value changed
            let setting = sender.isOn
            TermsAndConditionSwitch.setOn(setting, animated: true)
    }
    
    // Register button
    @IBAction func registerButtonAction (_ sender: UIButton) {
        //If they are all empty, show an alert to the user
        if self.FirstNamextField.text!.isEmpty || self.LastNameTextField.text!.isEmpty || self.EmailTextField.text!.isEmpty || self.PasswordTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"All fields are required", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        // If the switch is not turned on, show an alert to the user
        else if !TermsAndConditionSwitch.isOn {
            let alert = UIAlertController(title: "Terms and Conditions",
                                          message: "Please accept the terms and conditions",
                                          preferredStyle: .alert)

            let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okayAction)

            present(alert, animated: true, completion: nil)
        }
        else {
            // Get the next available user ID.
            let nextUserId = cruiseDbManager.getAllUsers().count + 1
                        
            // Call insertUser to add the new user to the database
            let userCreationSuccessful = cruiseDbManager.insertUser(
                id: nextUserId,
                first_name: self.FirstNamextField.text!,
                last_name: self.LastNameTextField.text!,
                email: self.EmailTextField.text!,
                password: self.PasswordTextField.text!
            )
            
            if userCreationSuccessful {
                 // User created successfully!
                let alert = UIAlertController(title: "Register Success",
                    message:"Your details have been registered", preferredStyle: .alert)
                
                let proceedAction = UIAlertAction(title: "Proceed", style: .cancel) { [weak self] _ in
                    // Instantiate the login view
                    let loginView = self?.storyboard?.instantiateViewController(identifier: "login") as! LoginViewController
                    self?.navigationController?.pushViewController(loginView, animated: true)
                }

                alert.addAction(proceedAction)

                present(alert, animated: true, completion: nil)
            
                
             } else {
                 // Show an alert
                 let alert = UIAlertController(title: "Ooops!..Something went wrong",
                                               message: "Please check your details",
                                               preferredStyle: .alert)

                 let okayAction = UIAlertAction(title: "Fix now", style: .cancel, handler: nil)
                 alert.addAction(okayAction)

                 present(alert, animated: true, completion: nil)
             }
        }
    }
}
