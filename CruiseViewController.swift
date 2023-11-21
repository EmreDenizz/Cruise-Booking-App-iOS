//
//  CruiseViewController.swift
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

class CruiseViewController: UIViewController {
    
    var cruiseName: String?
    var cruisePrice: String?
    
    //Reference to the cruise name label
    @IBOutlet weak var CruiseNameLabel: UILabel!
    
    //Reference to the cruise price label
    @IBOutlet weak var CruisePriceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        CruiseNameLabel.text = cruiseName
        CruisePriceLabel.text = "$" + cruisePrice!

    }
    
    
    @IBAction func onProceed(_ sender: UIButton) {
        
        // Instantiate the confirm view
        let guestView = storyboard?.instantiateViewController(identifier: "guests") as! GuestsViewController
        
        //Pass details to confirm view screen
        guestView.cruiseName = cruiseName
        guestView.cruisePrice = cruisePrice
        
        self.navigationController?.pushViewController(guestView, animated: true)
    }

   

}
