//
//  DesafioViewController.swift
//  PickerView
//
//  Created by Matheus B. Grigoletto on 21/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

struct Color {
    var name: String?
    var bgColor: UIColor?
    var labelColor: UIColor?
}

class DesafioViewController: UIViewController {

    @IBOutlet weak var colorPickerView: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    
    let colors = [
        Color(name: "Cyan", bgColor: .cyan, labelColor: .black),
        Color(name: "Green", bgColor: .green, labelColor: .black),
        Color(name: "Orange", bgColor: .orange, labelColor: .black),
        Color(name: "Blue", bgColor: .systemBlue, labelColor: .white),
        Color(name: "Red", bgColor: .systemRed, labelColor: .white),
        Color(name: "Dark Gray", bgColor: .darkGray, labelColor: .white),
    ]
    
    func config() {
        self.colorPickerView.delegate = self
        self.colorPickerView.dataSource = self
        
        self.colorPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    func setColors(ofRow row: Int) {
        self.colorLabel.text = self.colors[row].name
        self.colorLabel.textColor = self.colors[row].labelColor
        self.view.backgroundColor = self.colors[row].bgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.definesPresentationContext = true

        self.config()
        self.setColors(ofRow: self.colorPickerView.selectedRow(inComponent: 0))
    }

}

extension DesafioViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.colors[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.setColors(ofRow: row)
    }
}
