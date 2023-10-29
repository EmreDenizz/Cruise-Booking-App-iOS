//
//  HomeViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Obi Nkemjika Derick on 2023-10-28.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Reference to the cruise image
    @IBOutlet weak var cruiseImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cruiseDetailAction))

        // add gesture to the image view;
        cruiseImageView.addGestureRecognizer(tapGesture)
        
    }
    
    //Search input action - This allows the user move to the search screen they click the input field
    @IBAction func searchButtonAction (_ sender: Any) {
        let control = storyboard?.instantiateViewController(withIdentifier: "search") as! SearchViewController
        
        present(control, animated: true)
    }
    
    //Cruise detail action
    @objc func cruiseDetailAction (gesture: UIGestureRecognizer) {
        let control = storyboard?.instantiateViewController(withIdentifier: "cruise") as! CruiseViewController
        
        present(control, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
