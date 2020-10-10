//
//  EnderecoViewController.swift
//  Cadastro
//
//  Created by Matheus B. Grigoletto on 07/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class EnderecoViewController: UIViewController {

    @IBOutlet weak var logradouroTextField: UITextField!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var salvarEnderecoButton: UIButton!
    
    fileprivate func initDelegates() {
        self.logradouroTextField.delegate = self
        self.numeroTextField.delegate = self
        self.bairroTextField.delegate = self
        self.cidadeTextField.delegate = self
        self.estadoTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDelegates()
        
        self.salvarEnderecoButton.layer.cornerRadius = 4
    }
    
    @IBAction func tappedSalvarButton(_ sender: UIButton) {
        // TODO: remover
        self.dismiss(animated: true, completion: nil)
    }
}

extension EnderecoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.logradouroTextField) {
            self.numeroTextField.becomeFirstResponder()
        } else if textField.isEqual(self.numeroTextField) {
            self.bairroTextField.becomeFirstResponder()
        } else if textField.isEqual(self.bairroTextField) {
            self.cidadeTextField.becomeFirstResponder()
        } else if textField.isEqual(self.cidadeTextField) {
            self.estadoTextField.becomeFirstResponder()
        } else if textField.isEqual(self.estadoTextField) {
           textField.resignFirstResponder()
        }
        
        return true
    }
}
