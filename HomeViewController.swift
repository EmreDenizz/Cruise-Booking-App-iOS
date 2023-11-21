//
//  HomeViewController.swift
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

class HomeViewController: UIViewController {
    
    //Reference to the cruise image
    //@IBOutlet weak var cruiseImageView1: UIImageView!
    
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
    
    @IBAction func firstCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[0].name
        cruiseView.cruisePrice = String(cruises[0].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    @IBAction func secondCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[1].name
        cruiseView.cruisePrice = String(cruises[1].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    @IBAction func thirdCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[2].name
        cruiseView.cruisePrice = String(cruises[2].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    @IBAction func fourthCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = cruises[3].name
        cruiseView.cruisePrice = String(cruises[3].price)
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }

}
