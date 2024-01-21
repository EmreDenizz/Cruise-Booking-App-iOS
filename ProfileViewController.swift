//
//  ProfileViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
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
    
    //countrypicker object
    @IBOutlet var countryPicker: UIPickerView!
    
    //cityPicker object
    @IBOutlet var cityPicker: UIPickerView!

    //Country names options
    private let countryNames = ["Canada", "US"]

    //City name options
    private var cityNames = ["Toronto", "Vancouver", "Alberta", "Saskatchewan", "Montreal", "Halifax", "Missisauga", "Hamilton"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get current user email from UserDefaults
        let currentUserEmail = defaults.string(forKey: "currentUserEmail")
        
        // Get current user info from db
        user = db.getUser(email: currentUserEmail!)
        
        //set up datasource and delegate for country picker component
        countryPicker.dataSource = self
        countryPicker.delegate = self
        
        //set up datasource and delegate for city picker component
        cityPicker.dataSource = self
        cityPicker.delegate = self
        
        emailLabel.text = currentUserEmail
        nameLabel.text = user[0].first_name + " " + user[0].last_name
        addressLabel.text = user[0].address + " " + user[0].city + " " + user[0].country
        
        // Set name, address, city and country values from db
        FirstNameTextField.text = user[0].first_name
        LastNameTextField.text = user[0].last_name
        AddressTextField.text = user[0].address
        
        // Set the default values for the picker views
        if let countryIndex = countryNames.firstIndex(of: user[0].country) {
            countryPicker.selectRow(countryIndex, inComponent: 0, animated: false)
            
            if user[0].country == "US" {
                cityNames = ["Atlanta", "New York", "Washington", "New Orleans", "Seattle", "Philladephia", "New Jersey"]
            }
            else {
                cityNames = ["Toronto", "Vancouver", "Alberta", "Saskatchewan", "Montreal", "Halifax", "Missisauga", "Hamilton"]
            }
        }

        if let cityIndex = cityNames.firstIndex(of: user[0].city) {
            cityPicker.selectRow(cityIndex, inComponent: 0, animated: false)
        }

        // Set the initial data for the cityPicker
        updateCityPickerData(for: user[0].country)
    }
    
    //If we had multiple countries for example
    func updateCityPickerData(for country: String) {
          if country == "Canada" {
              cityNames = ["Toronto", "Vancouver", "Alberta", "Saskatchewan", "Montreal", "Halifax", "Missisauga", "Hamilton"]
          } else if country == "US" {
              // Handle other countries
              cityNames = ["Atlanta", "New York", "Washington", "New Orleans", "Seattle", "Philladephia", "New Jersey"]
          }

          // Reload the cityPicker data
          cityPicker.reloadAllComponents()
    }
    
    // Update profile button
    @IBAction func updateProfileButton(_ sender: UIButton) {
        
        //If they are all empty, show an alert to the user
        if self.FirstNameTextField.text!.isEmpty || self.LastNameTextField.text!.isEmpty || self.AddressTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"All fields are required", preferredStyle: .alert)
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            alert.addAction(clearAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            // get selected country from the picker
            let row_country = countryPicker.selectedRow(inComponent: 0)
            let selected_country = countryNames[row_country]
            
            // get selected city from the picker
            let row_city = cityPicker.selectedRow(inComponent: 0)
            let selected_city = cityNames[row_city]
            
            // Call updateUser to update the user in the database
            let userUpdateSuccessful = db.updateUser(
                first_name: self.FirstNameTextField.text!,
                last_name: self.LastNameTextField.text!,
                address: self.AddressTextField.text!,
                city: selected_city,
                country: selected_country,
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

// Picker Data Source Methods for City Picker
extension ProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        // Check which picker view is requesting data
        if pickerView == countryPicker {
            return countryNames.count
        } else if pickerView == cityPicker {
            return cityNames.count
        }
        return 0
    }
}

// Picker Delegate Methods
extension ProfileViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Check which picker view is requesting data
        if pickerView == countryPicker {
            return countryNames[row]
        } else if pickerView == cityPicker {
            return cityNames[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Handle the selection for both picker views if needed
        if pickerView == countryPicker {
            // Handle country selection
            let selectedCountry = countryNames[row]
            updateCityPickerOptions(for: selectedCountry)
        } else if pickerView == cityPicker {
            // Handle city selection
        }
    }
}

// Additional method to update cityPicker options based on selected country
extension ProfileViewController {
    func updateCityPickerOptions(for country: String) {
        if country == "Canada" {
            cityNames = ["Toronto", "Vancouver", "Alberta", "Saskatchewan", "Montreal", "Halifax", "Missisauga", "Hamilton"]
        } else if country == "US" {
            // Handle other countries
            cityNames = ["Atlanta", "New York", "Washington", "New Orleans", "Seattle", "Philladephia", "New Jersey"]
        }

        // Reload the cityPicker data
        cityPicker.reloadAllComponents()
    }
}

