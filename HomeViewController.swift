//
//  HomeViewController.swift
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

class HomeViewController: UIViewController {
    
    
    //Reference to the cruise image
    //@IBOutlet weak var cruiseImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    
    @IBAction func firstCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = "The Bahamas"
        cruiseView.cruisePrice = "340.54"
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    @IBAction func secondCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = "Santorini, Greece"
        cruiseView.cruisePrice = "115.54"
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    @IBAction func thirdCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = "Kauai Maui"
        cruiseView.cruisePrice = "90.54"
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }
    
    
    @IBAction func fourthCruiseButtonAction(_ sender: UIButton) {
        // Instantiate the customer view
        let cruiseView = storyboard?.instantiateViewController(identifier: "cruise") as! CruiseViewController
        
        //Pass details to confirm view screen
        cruiseView.cruiseName = "The Maldives"
        cruiseView.cruisePrice = "200.54"
        
        self.navigationController?.pushViewController(cruiseView, animated: true)
    }


}
