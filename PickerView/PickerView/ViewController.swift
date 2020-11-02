//
//  ViewController.swift
//  PickerView
//
//  Created by Matheus B. Grigoletto on 21/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: # IBOutlets
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: # Class properties
    
    let arrayPickerView: [String] = [
        "Cupertino",
        "Montain View",
        "Catalina",
        "Sierra",
        "Taylor Swift",
    ]
    
    // MARK: # Class methods
    
    func config() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        self.pickerView.selectRow(4, inComponent: 0, animated: true)
        self.label.text = self.arrayPickerView[self.pickerView.selectedRow(inComponent: 0)]
    }
    
    
    // MARK: # LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.config()
    }
    
    // MARK: # IBActions

    @IBAction func openDesafioViewController(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DesafioSegue", sender: nil)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayPickerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.label.text = self.arrayPickerView[row]
    }

}
