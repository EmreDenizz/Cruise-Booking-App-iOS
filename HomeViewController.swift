//
//  HomeViewController.swift
//  Team3_MAPD714_Project-Milestone3
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-12-01
//  @description iOS Project - Milestone 4
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
//

import UIKit

class HomeViewController: UIViewController {
    
    //Reference to the cruise image
    //@IBOutlet weak var cruiseImageView1: UIImageView!
    
    // import db manager
    var db = CruiseDBManager()
    var cruises = Array<Cruise>()
    
    @IBOutlet var cruise_1_name: UILabel!
    @IBOutlet var cruise_1_price: UILabel!
    @IBOutlet var cruise_2_name: UILabel!
    @IBOutlet var cruise_2_price: UILabel!
    @IBOutlet var cruise_3_name: UILabel!
    @IBOutlet var cruise_3_price: UILabel!
    @IBOutlet var cruise_4_name: UILabel!
    @IBOutlet var cruise_4_price: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get cruises from DB
        cruises = db.getCruises()
        
        // Set cruise details on cards
        cruise_1_name.text = cruises[0].name
        cruise_1_price.text = "$ "+String(cruises[0].price)
        cruise_2_name.text = cruises[1].name
        cruise_2_price.text = "$ "+String(cruises[1].price)
        cruise_3_name.text = cruises[2].name
        cruise_3_price.text = "$ "+String(cruises[2].price)
        cruise_4_name.text = cruises[3].name
        cruise_4_price.text = "$ "+String(cruises[3].price)
    }
    // My profile button action
    @IBAction func myProfileButton(_ sender: UIButton) {
        let profileView = storyboard?.instantiateViewController(identifier: "profile") as! ProfileViewController
        self.navigationController?.pushViewController(profileView, animated: true)
    }
    // First cruise button action
    @IBAction func firstCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[0].name
        cruiseView.cruisePrice = String(cruises[0].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    // Second cruise button action
    @IBAction func secondCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[1].name
        cruiseView.cruisePrice = String(cruises[1].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    // Third cruise button action
    @IBAction func thirdCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[2].name
        cruiseView.cruisePrice = String(cruises[2].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    // Forth cruise button action
    @IBAction func fourthCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[3].name
        cruiseView.cruisePrice = String(cruises[3].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }

}
