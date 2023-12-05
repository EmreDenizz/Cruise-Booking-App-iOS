//
//  ProfileViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-12-01
//  @description iOS Project - Milestone 4
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import UIKit

class ProfileViewController: UIViewController {
    
    // import db manager
    var db = CruiseDBManager()
    var user = Array<User>()
    
    // get UserDefaults
    let defaults = UserDefaults.standard
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var CountryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get current user email from UserDefaults
        let currentUserEmail = defaults.string(forKey: "currentUserEmail")
        
        // Get current user info from db
        user = db.getUser(email: currentUserEmail!)
        
        emailLabel.text = currentUserEmail
        nameLabel.text = user[0].first_name + " " + user[0].last_name
        addressLabel.text = user[0].address + " " + user[0].city + " " + user[0].country
        
        // Set name, address, city and country values from db
        FirstNameTextField.text = user[0].first_name
        LastNameTextField.text = user[0].last_name
        AddressTextField.text = user[0].address
        CityTextField.text = user[0].city
        CountryTextField.text = user[0].country
    }
    // Update profile button
    @IBAction func updateProfileButton(_ sender: UIButton) {
        
        //If they are all empty, show an alert to the user
        if self.FirstNameTextField.text!.isEmpty || self.LastNameTextField.text!.isEmpty || self.AddressTextField.text!.isEmpty || self.CityTextField.text!.isEmpty || self.CountryTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"All fields are required", preferredStyle: .alert)
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            alert.addAction(clearAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            // Call updateUser to update the user in the database
            let userUpdateSuccessful = db.updateUser(
                first_name: self.FirstNameTextField.text!,
                last_name: self.LastNameTextField.text!,
                address: self.AddressTextField.text!,
                city: self.CityTextField.text!,
                country: self.CountryTextField.text!,
                email: defaults.string(forKey: "currentUserEmail")!
            )
            
            if userUpdateSuccessful {
                 // User updated successfully!
                let alert = UIAlertController(title: "Profile Update Success",
                    message:"Your details have been updated.", preferredStyle: .alert)
                let proceedAction = UIAlertAction(title: "Home", style: .cancel) { [weak self] _ in
                    // Instantiate the home view
                    let homeView = self?.storyboard?.instantiateViewController(identifier: "home_view") as! HomeViewController
                    self?.navigationController?.pushViewController(homeView, animated: true)
                }
                alert.addAction(proceedAction)
                present(alert, animated: true, completion: nil)
             } else {
                 // Show an alert
                 let alert = UIAlertController(title: "Ooops!..Something went wrong",
                                               message: "Please check your details.",
                                               preferredStyle: .alert)
                 let okayAction = UIAlertAction(title: "Fix now", style: .cancel, handler: nil)
                 alert.addAction(okayAction)
                 present(alert, animated: true, completion: nil)
             }
        }
        
    }
    
    // Logout button
    @IBAction func logoutButton(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "currentUserEmail")
        let splashView = storyboard?.instantiateViewController(identifier: "home") as! SlashScreenController
        self.navigationController?.pushViewController(splashView, animated: true)
    }

}
