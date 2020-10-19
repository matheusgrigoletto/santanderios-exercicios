//
//  SecondVC.swift
//  TransicaoTela
//
//  Created by Felipe Miranda on 23/09/20.
//

import UIKit


protocol CadastroEnderecoVCProtocol: class {
    
    func successRegisterAddress(address: Endereco)
    
}

class CadastroEnderecoVC: UIViewController {

    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    
    weak var delegate: CadastroEnderecoVCProtocol?

    fileprivate func configTextFields() {
        
        self.ruaTextField.delegate = self
        self.complementoTextField.delegate = self
        self.cidadeTextField.delegate =  self
        self.bairroTextField.delegate = self
        self.estadoTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTextFields()
        
        print(" viewDidLoad Second")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicouCadastrarEndereco(_ sender: UIButton) {
        
        if self.ruaTextField.text?.isEmpty == true || self.bairroTextField.text?.isEmpty == true || self.estadoTextField.text?.isEmpty == true || self.cidadeTextField.text?.isEmpty == true {
            
            print("falta campo obrigatorio")
            
        }else {
            
            var endereco: Endereco = Endereco(rua: self.ruaTextField.text, complemento: self.complementoTextField.text, bairro: self.bairroTextField.text, cidade: self.cidadeTextField.text, estado: self.estadoTextField.text)
            
            
            // disparar o delegate
            self.delegate?.successRegisterAddress(address: endereco)
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func clicouVoltarButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        print("viewWillDisappear Second")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear Second")
        
        print("===============")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear Second")

    }
}

extension CadastroEnderecoVC: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case self.ruaTextField:
            self.complementoTextField.becomeFirstResponder()
        case self.complementoTextField:
            self.cidadeTextField.becomeFirstResponder()
        case self.cidadeTextField:
            self.bairroTextField.becomeFirstResponder()
        case self.bairroTextField:
            self.estadoTextField.becomeFirstResponder()
        default:
            self.estadoTextField.resignFirstResponder()
        }
        
        return true
    }
}
