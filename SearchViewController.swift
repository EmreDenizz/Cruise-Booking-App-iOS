//
//  SearchViewController.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import UIKit

class SearchViewController: UIViewController {
    
    //category picker object
    @IBOutlet var categoryPicker: UIPickerView!

    private let categoryNames = ["Bahamas Cruise", "Carribean Cruise", "Cuber Cruise", "Sampler Cruise", "Star Cruise"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //set up datasource and delegate for single picker component
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
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

// MARK: Picker Data Source Methods
extension SearchViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return categoryNames.count
    }
}

extension SearchViewController: UIPickerViewDelegate {
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryNames[row]
    }
}
