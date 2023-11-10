//
//  CustomerViewController.swift
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

class CustomerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Continue button
    @IBAction func continueButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "paymentType") as! PaymentTypeViewController
        
        present(control, animated: true)
    }

}
