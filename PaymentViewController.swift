//
//  PaymentViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import UIKit

class PaymentViewController: UIViewController {
    let theImageView = UIImageView()
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
    
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expiryMonth: UITextField!
    @IBOutlet weak var expiryYear: UITextField!
    @IBOutlet weak var nameOnCard: UITextField!
    
    @IBOutlet weak var proceedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        designVisaImage()
        
        proceedButton.configuration?.title = "Pay $" + cruisePrice!
    }
    
    // Add credit card image programmatically
    func designVisaImage(){
        view.addSubview(theImageView)
        
        theImageView.image = UIImage(named: "visa_mastercard.jpg")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            theImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theImageView.widthAnchor.constraint(equalToConstant: 284),
            theImageView.heightAnchor.constraint(equalToConstant: 150),
            theImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
    }
    
    // Payment button action
    @IBAction func onProceed(_ sender: UIButton) {
        
        //If they are all empty, show an alert to the user
        if self.cardNumber.text!.isEmpty || self.expiryMonth.text!.isEmpty || self.expiryYear.text!.isEmpty || self.nameOnCard.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"Please, all fields are required.", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        // validate card number
        else if self.cardNumber.text!.count != 16 {
            let alert = UIAlertController(title: "Invalid Card Number",
                                          message: "Please enter a 16 digit valid credit card number.",
                                          preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okayAction)

            present(alert, animated: true, completion: nil)
        }
        // validate expiry month
        else if Int(self.expiryMonth.text!)! < 1 || Int(self.expiryMonth.text!)! > 12 {
            let alert = UIAlertController(title: "Invalid Card Expiry Date",
                                          message: "Please enter a valid card expiry dates.",
                                          preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okayAction)

            present(alert, animated: true, completion: nil)
        }
        // validate expiry year
        else if Int(self.expiryYear.text!)! < 24 || Int(self.expiryYear.text!)! > 30 {
            let alert = UIAlertController(title: "Invalid Card Expiry Date",
                                          message: "Please enter a valid card expiry dates.",
                                          preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okayAction)

            present(alert, animated: true, completion: nil)
        }
        else{
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
            
            self.navigationController?.pushViewController(confirmView, animated: true)
        }
        
    }

}
