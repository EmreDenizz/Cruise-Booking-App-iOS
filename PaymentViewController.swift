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
    let theImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        designVisaImage()
    }
    
    func designVisaImage(){
        view.addSubview(theImageView)
        
        theImageView.image = UIImage(named: "visa_mastercard.jpg")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            theImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theImageView.widthAnchor.constraint(equalToConstant: 284),
            theImageView.heightAnchor.constraint(equalToConstant: 150),
            theImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
    }

}
