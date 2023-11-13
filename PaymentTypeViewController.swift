//
//  PaymentTypeViewController.swift
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

class PaymentTypeViewController: UIViewController {
    
    //Instantiate a variable to hold the values of the user booking
    var adultValue: String?
    var childrenValue: String?
    var seniorValue: String?
    
    
    var customerValue: String?
    var addressValue: String?
    var cityValue: String?
    var countryValue: String?
    var cruiseName: String?
    var cruisePrice: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onProceed(_ sender: UIButton) {

        // Instantiate the payment type view
        let paymentView = storyboard?.instantiateViewController(identifier: "payment") as! PaymentViewController
        
        //Pass details to confirm view screen
        paymentView.customerValue = customerValue
        paymentView.addressValue = addressValue
        paymentView.cityValue = cityValue
        paymentView.countryValue = countryValue
        paymentView.adultValue = adultValue
        paymentView.childrenValue = childrenValue
        paymentView.seniorValue = seniorValue
        paymentView.cruiseName = cruiseName
        paymentView.cruisePrice = cruisePrice
        
        self.navigationController?.pushViewController(paymentView, animated: true)

    }
    

}
