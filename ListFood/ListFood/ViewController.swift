//
//  ViewController.swift
//  ListFood
//
//  Created by Matheus B. Grigoletto on 01/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var precoTextField: UITextField!
    @IBOutlet weak var categoriaSegmented: UISegmentedControl!
    @IBOutlet weak var veganoSegmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nomeTextField.delegate = self
        self.pesoTextField.delegate = self
        self.precoTextField.delegate = self
        //self.categoriaSegmented.delegate = self
        //self.veganoSegmented.delegate = self
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
           nextField.becomeFirstResponder()
        }

        return false
    }
}
