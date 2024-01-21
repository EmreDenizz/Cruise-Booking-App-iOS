//
//  GuestsViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import UIKit

class GuestsViewController: UIViewController {
    
    //Reference to the adult text field
    @IBOutlet weak var AdultTextField: UITextField!
    
    //Reference to the children text field
    @IBOutlet weak var ChildrenTextField: UITextField!
    
    //Reference to the senior text field
    @IBOutlet weak var SeniorTextField: UITextField!
    
    var cruiseName: String?
    var cruisePrice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Proceed to customer information button
    @IBAction func onProceed(_ sender: UIButton) {
        
        //If they are all empty, show an alert to the user
        if self.AdultTextField.text!.isEmpty && self.ChildrenTextField.text!.isEmpty && self.SeniorTextField.text!.isEmpty {
            
            let alert = UIAlertController(title: "Incomplete form!",
                message:"Please select number of guests", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        else if self.AdultTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Incomplete form!",
                message:"Please select at least one adult", preferredStyle: .alert)
            
            let clearAction = UIAlertAction(title: "Rectify", style: .cancel, handler: nil)
            
            alert.addAction(clearAction)

            present(alert, animated: true, completion: nil)
        }
        else {
            // Instantiate the customer view
            let customerView = storyboard?.instantiateViewController(identifier: "customer") as! CustomerViewController
            
            //Pass details to confirm view screen
            customerView.adultValue = AdultTextField.text!
            customerView.childrenValue = ChildrenTextField.text!
            customerView.seniorValue = SeniorTextField.text!
            customerView.cruiseName = cruiseName
            customerView.cruisePrice = cruisePrice
            
            self.navigationController?.pushViewController(customerView, animated: true)
        }

    }

}
