//
//  SearchViewController.swift
//  Team3_MAPD714_Project-Milestone2
//
//  Created by Emre Deniz on 2023-10-27.
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

}

// MARK:-
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
