//
//  PaymentTypeViewController.swift
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

class PaymentTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Apple Pay button
    @IBAction func applePayButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "payment") as! PaymentViewController
        
        present(control, animated: true)
    }
    
    // Google Pay button
    @IBAction func googlePayButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "payment") as! PaymentViewController
        
        present(control, animated: true)
    }
    
    // Credit Card button
    @IBAction func creditCardButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "payment") as! PaymentViewController
        
        present(control, animated: true)
    }

}
