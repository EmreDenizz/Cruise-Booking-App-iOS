//
//  PaymentViewController.swift
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

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add visa_mastercard image programmatically
        let imgName = "visa_mastercard.jpg"
        let image = UIImage(named: imgName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 22, y: 670, width: 75, height: 60)
        view.addSubview(imageView)
    }
    
    // Pay button
    @IBAction func payButtonAction (_ sender: UIButton) {
        let control = storyboard?.instantiateViewController(withIdentifier: "confirm") as! ConfirmViewController
        
        present(control, animated: true)
    }

}
