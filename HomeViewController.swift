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

        // create tap gesture recognizer
        //let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(cruiseDetailAction1))
        

        // add gesture to the image view;
        //cruiseImageView1.addGestureRecognizer(tapGesture1)
        
        
        
    }
    
//    @IBAction func openCruise1(_ sender: Any) {
//        //let control = storyboard?.instantiateViewController(withIdentifier: "cruise") as! CruiseViewController
//        //present(control, animated: true)
//        print("Testing")
//    }
    //Search input action - This allows the user move to the search screen they click the input field
//    @IBAction func searchButtonAction (_ sender: Any) {
//        let control = storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
//        
//        present(control, animated: true)
//    }
    
    //Cruise detail action
//    @objc func cruiseDetailAction1 (gesture: UIGestureRecognizer) {
//        let control = storyboard?.instantiateViewController(withIdentifier: "cruise") as! CruiseViewController
//        present(control, animated: true)
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
