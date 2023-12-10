//
//  PaymentTypeViewController.swift
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
    // Apple button action
    @IBAction func onApplePay(_ sender: UIButton) {
        let alert = UIAlertController(title: "Apple Pay",
            message:"", preferredStyle: .alert)
        
        // Instantiate the confirm view
        let confirmView = storyboard?.instantiateViewController(identifier: "confirm") as! ConfirmViewController
        
        //Pass details to confirm view screen
        confirmView.customerValue = customerValue
        confirmView.addressValue = addressValue
        confirmView.cityValue = cityValue
        confirmView.countryValue = countryValue
        confirmView.adultValue = adultValue
        confirmView.childrenValue = childrenValue
        confirmView.seniorValue = seniorValue
        confirmView.cruiseName = cruiseName
        confirmView.cruisePrice = cruisePrice
        
        let proceedAction = UIAlertAction(title: "Make Payment", style: .cancel) { [weak self] _ in
            self?.navigationController?.pushViewController(confirmView, animated: true)
        }
        
        alert.addAction(proceedAction)
        present(alert, animated: true, completion: nil)
    }
    // Google button action
    @IBAction func onGooglePay(_ sender: UIButton) {
        let alert = UIAlertController(title: "Google Pay",
            message:"", preferredStyle: .alert)
        
        // Instantiate the confirm view
        let confirmView = storyboard?.instantiateViewController(identifier: "confirm") as! ConfirmViewController
        
        //Pass details to confirm view screen
        confirmView.customerValue = customerValue
        confirmView.addressValue = addressValue
        confirmView.cityValue = cityValue
        confirmView.countryValue = countryValue
        confirmView.adultValue = adultValue
        confirmView.childrenValue = childrenValue
        confirmView.seniorValue = seniorValue
        confirmView.cruiseName = cruiseName
        confirmView.cruisePrice = cruisePrice
        
        let proceedAction = UIAlertAction(title: "Make Payment", style: .cancel) { [weak self] _ in
            self?.navigationController?.pushViewController(confirmView, animated: true)
        }
        
        alert.addAction(proceedAction)
        present(alert, animated: true, completion: nil)
    }
    // Credit card button action
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
