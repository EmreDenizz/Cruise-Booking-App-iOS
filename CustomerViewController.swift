//
//  CustomerViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import UIKit

class CustomerViewController: UIViewController {
    
    // import db
    var db = CruiseDBManager()
    var user = Array<User>()
    
    // Get UserDefaults
    let defaults = UserDefaults.standard
    
    //Reference to the customer text field
    @IBOutlet weak var CustomerNameTextField: UITextField!
    
    //Reference to the address text field
    @IBOutlet weak var AddressTextField: UITextField!
    
    //Reference to the city text field
    @IBOutlet weak var CityTextField: UITextField!
    
    //Reference to the country text field
    @IBOutlet weak var CountryTextField: UITextField!
    
    //Instantiate a variable to hold the values of the user booking
    var adultValue: String?
    var childrenValue: String?
    var seniorValue: String?
    var cruiseName: String?
    var cruisePrice: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get current user email
        let currentUserEmail = defaults.string(forKey: "currentUserEmail")
        
        // Get current user info from db
        user = db.getUser(email: currentUserEmail!)
        
        // Set name, address, city and country values from db
        CustomerNameTextField.text = user[0].first_name + " " + user[0].last_name
        AddressTextField.text = user[0].address
        CityTextField.text = user[0].city
        CountryTextField.text = user[0].country
    }
    // Proceed to payment button action
    @IBAction func onProceed(_ sender: UIButton) {
        
        //If they are all empty, show an alert to the user
        if self.CustomerNameTextField.text!.isEmpty || self.AddressTextField.text!.isEmpty || self.CityTextField.text!.isEmpty || self.CountryTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"Please all fields are required", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        else {
            // Instantiate the payment type view
            let paymentTypeView = storyboard?.instantiateViewController(identifier: "paymentType") as! PaymentTypeViewController
            
            //Pass details to confirm view screen
            paymentTypeView.customerValue = CustomerNameTextField.text!
            paymentTypeView.addressValue = AddressTextField.text!
            paymentTypeView.cityValue = CityTextField.text!
            paymentTypeView.countryValue = CountryTextField.text!
            paymentTypeView.adultValue = adultValue
            paymentTypeView.childrenValue = childrenValue
            paymentTypeView.seniorValue = seniorValue
            paymentTypeView.cruiseName = cruiseName
            paymentTypeView.cruisePrice = cruisePrice
            
            self.navigationController?.pushViewController(paymentTypeView, animated: true)
        }

    }

}
