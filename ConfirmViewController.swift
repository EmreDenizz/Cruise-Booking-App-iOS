//
//  ConfirmViewController.swift
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
        //        print(customerValue!)


//        if adultValue != nil && childrenValue != nil && seniorValue != nil && customerValue != nil && addressValue != nil && cityValue != nil && countryValue != nil {
//            
//        }
        
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

}
