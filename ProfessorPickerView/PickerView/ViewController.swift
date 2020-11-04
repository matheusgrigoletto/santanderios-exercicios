//
//  ViewController.swift
//  PickerView
//
//  Created by Felipe Miranda on 21/10/20.
//  Copyright © 2020 Digital House. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    let arrayPickerView = ["Vermelho","Rosa","Azul","Verde", "Cinza"]
    let arrayCores = [UIColor.red, UIColor.systemPink, UIColor.blue, UIColor.green, UIColor.gray]
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.selectRow(1, inComponent: 0, animated: true)
        self.resultLabel.text = self.arrayPickerView[self.myPickerView.selectedRow(inComponent: 0)]
        self.view.backgroundColor = self.arrayCores[self.myPickerView.selectedRow(inComponent: 0)]
        // Do any additional setup after loading the view.
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
        
        
        let tempArray = self.arrayCores.filter{$0 != self.arrayCores[row]}
        
        self.resultLabel.textColor = tempArray.randomElement()
        
        self.view.backgroundColor = self.arrayCores[row]
        self.resultLabel.text = self.arrayPickerView[row]
        
        
    }

}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
