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
    
    // MARK: IBOutlets User
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dataNascimentoTextField: UITextField!
    
    // MARK: IBOutlets View Endereço
    @IBOutlet weak var cadastrarEnderecoButton: UIButton!
    @IBOutlet weak var enderecoTextoLabel: UILabel!
    
    fileprivate func initDelegates() {
        self.nomeTextField.delegate = self
        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
        self.dataNascimentoTextField.delegate = self
    }
    
    fileprivate func initElements() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initDelegates()
        self.initElements()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    func validateUsuarioFields() -> Bool {
        if self.nomeTextField.text?.isEmpty == true || self.cpfTextField.text?.isEmpty == true || self.emailTextField.text?.isEmpty == true || self.dataNascimentoTextField.text?.isEmpty == true {
            print("validateUsuarioFields: Existem campos obrigatórios ainda não preenchidos")
            return false
        }
        return true
    }
    
    @IBAction func tappedCadastrarEnderecoButton(_ sender: UIButton) {
        if self.validateUsuarioFields() {
            self.performSegue(withIdentifier: self.enderecoSEGUE, sender: nil)
        } else {
            print("tappedCadastrarEnderecoButton: Existem campos obrigatórios ainda não preenchidos")
        }
    }
    
    var isRegisterValid: Bool = false
    var Usuario: Usuario?
    
    fileprivate func validateTextField(textField: UITextField) {
        if let value = textField.text {
            self.isRegisterValid = !value.isEmpty
        } else {
            self.isRegisterValid = false
        }

        print("validateTextField, self.isRegisterValid = \(self.isRegisterValid)")
    }
}

extension CadastroViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.nomeTextField) {
            self.cpfTextField.becomeFirstResponder()
        } else if textField.isEqual(self.cpfTextField) {
            self.emailTextField.becomeFirstResponder()
        } else if textField.isEqual(self.emailTextField) {
            self.dataNascimentoTextField.becomeFirstResponder()
        } else if textField.isEqual(self.dataNascimentoTextField) {
           textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.validateTextField(textField: textField)
    }
}

