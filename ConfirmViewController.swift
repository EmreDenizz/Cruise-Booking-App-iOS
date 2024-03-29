//
//  ConfirmViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    //Reference to the customer label
    @IBOutlet weak var CustomerNameLabel: UILabel!
    
    //Reference to the address label
    @IBOutlet weak var AddressLabel: UILabel!
    
    //Reference to the city label
    @IBOutlet weak var CityLabel: UILabel!
    
    //Reference to the country label
    @IBOutlet weak var CountryLabel: UILabel!
    
    //Reference to the guest label
    @IBOutlet weak var GuestLabel: UILabel!
    
    //Reference to the cruise name label
    @IBOutlet weak var CruiseNameLabel: UILabel!
    
    //Reference to the cruise price label
    @IBOutlet weak var CruisePriceLabel: UILabel!
    
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
        
        // Set outputs on screen
        CustomerNameLabel.text = customerValue
        AddressLabel.text = addressValue
        CityLabel.text = cityValue
        CountryLabel.text = countryValue
        CruiseNameLabel.text = cruiseName
        CruisePriceLabel.text = "$" + cruisePrice!
        
        let adult = Double(adultValue!) ?? 0
        let children = Double(childrenValue!) ?? 0
        let senior = Double(seniorValue!) ?? 0
        
        let totalGuests = Int(adult + children + senior)
        GuestLabel.text = "\(totalGuests) guests"
    }
    
    @IBAction func homeButtonAction (_ sender: UIButton) {
        let homeView = self.storyboard?.instantiateViewController(identifier: "home_view") as! HomeViewController
        self.navigationController?.pushViewController(homeView, animated: true)
    }

}
