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
    @IBOutlet weak var isVeganoSegmented: UISegmentedControl!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nomeTextField.delegate = self
        self.pesoTextField.delegate = self
        self.precoTextField.delegate = self
        
        // Clicar na view, desaparece o teclado
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        // outra maneira de escrever:
        //let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboardObjC))

        self.view.addGestureRecognizer(tap)
        
        self.cadastrarButton.layer.cornerRadius = 6
    }
    
    // @objc para expor o método para Objective-C
    @objc private func dismissKeyboardObjC() {
        self.view.endEditing(true);
    }
    
    private func dismissKeyboard() {
        self.view.endEditing(true);
    }
    
    @IBAction func handleCategoriaChange(_ sender: UISegmentedControl) {
        self.dismissKeyboard();
    }
    
    
    @IBAction func handleVeganoChange(_ sender: UISegmentedControl) {
        self.dismissKeyboard();
    }
    
    @IBAction func handleCadastrarClick(_ sender: UIButton) {
        self.dismissKeyboard();
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(self.nomeTextField) {
            self.pesoTextField.becomeFirstResponder()
        }
        
        if textField.isEqual(self.pesoTextField) {
            self.precoTextField.becomeFirstResponder()
        }
        
        if textField.isEqual(self.precoTextField) {
            self.precoTextField.resignFirstResponder()
        }

        return true
    }
}
