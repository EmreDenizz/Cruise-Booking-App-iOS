//
//  CustomerViewController.swift
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

class CustomerViewController: UIViewController {
    
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


    }
    
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
