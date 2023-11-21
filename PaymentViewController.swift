//
//  PaymentViewController.swift
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
    
    @IBOutlet weak var proceedButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        designVisaImage()
        
        proceedButton.configuration?.title = "Pay $" + cruisePrice!
        
    }
    
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
    
    @IBAction func onProceed(_ sender: UIButton) {
        
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
