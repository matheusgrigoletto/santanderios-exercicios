//
//  ViewController.swift
//  Cadastro
//
//  Created by Matheus B. Grigoletto on 07/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    let enderecoSEGUE: String = "EnderecoSegue"
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dataNascimentoDatePicker: UIDatePicker!
    @IBOutlet weak var cadastrarEnderecoButton: UIButton!
    @IBOutlet weak var enderecoTextoLabel: UILabel!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    fileprivate func initDelegates() {
        self.nomeTextField.delegate = self
        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
    }
    
    fileprivate func initElements() {
        self.cadastrarButton.layer.cornerRadius = 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initDelegates()
        self.initElements()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @IBAction func tappedCadastrarEnderecoButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.enderecoSEGUE, sender: nil)
    }
}

extension CadastroViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.nomeTextField) {
            self.cpfTextField.becomeFirstResponder()
        } else if textField.isEqual(self.cpfTextField) {
            self.emailTextField.becomeFirstResponder()
        } else if textField.isEqual(self.emailTextField) {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

