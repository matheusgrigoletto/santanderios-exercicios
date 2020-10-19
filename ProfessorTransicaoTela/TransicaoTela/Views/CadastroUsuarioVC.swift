//
//  ViewController.swift
//  TransicaoTela
//
//  Created by Felipe Miranda on 23/09/20.
//

import UIKit

class CadastroUsuarioVC: UIViewController {
    
    // MARK: IBOutlets User
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    
    
    // MARK: IBOutlets endereço
    
    @IBOutlet weak var ruaTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var enderecoView: UIView!
    @IBOutlet weak var enderecoButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    var isRegisterValid: Bool = false
    
    var usuario: Usuario?
    
    
    // MARK: View Layout
    fileprivate func configScreen() {
        
        self.enderecoView.isHidden = true
        self.enderecoButton.layer.cornerRadius = 4
        self.cadastrarButton.layer.cornerRadius = 4
    }
    
    fileprivate func configTextFields() {
        
        self.nomeTextField.delegate = self
        self.cpfTextField.delegate = self
        self.emailTextField.delegate = self
        self.dataTextField.delegate = self
        
        self.ruaTextField.isUserInteractionEnabled = false
        self.complementoTextField.isUserInteractionEnabled = false
        self.cidadeTextField.isUserInteractionEnabled =  false
        self.bairroTextField.isUserInteractionEnabled = false
        self.estadoTextField.isUserInteractionEnabled = false
    }
    
    
    fileprivate func  validateFields(textField:UITextField){
        
        if let value = textField.text {
            
            if value.isEmpty {
                self.isRegisterValid = false
            }else{
                self.isRegisterValid = true
            }
            
        }else {
            self.isRegisterValid = false
        }
        
        print("=======validateFields=====  \(self.isRegisterValid)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configScreen()
        self.configTextFields()
        print("viewDidLoad first")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        print("viewWillDisappear first")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear first")
        print("===============")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear first")
    }
    
    @IBAction func cadastrarEndereco(_ sender: UIButton) {
        
        if self.nomeTextField.text?.isEmpty == true || self.cpfTextField.text?.isEmpty == true || self.emailTextField.text?.isEmpty == true || self.dataTextField.text?.isEmpty == true {
            
            print("tem campo que precisa ser preenchido")
            
            
        }else{
            
            //            let cpf: Int = Int(self.cpfTextField.text ?? "0") ?? 0
            let cpf2: Int? = Int(self.cpfTextField.text ?? "0")
            
            
            self.usuario = Usuario(nome: self.nomeTextField.text, cpf: cpf2 , email: self.emailTextField.text, data: self.dataTextField.text, endereco: nil)
            self.performSegue(withIdentifier: "CadastroEnderecoVC", sender: nil)
        }
        
    }
    
    @IBAction func tappedCadastrarButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "DetailVC", sender: "Felipe")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "CadastroEnderecoVC" {
            
            let vc: CadastroEnderecoVC? = segue.destination as? CadastroEnderecoVC
            vc?.delegate = self
            
        }else{
            
            let vc: DetailVC? = segue.destination as? DetailVC
            vc?.view.backgroundColor = .red
            vc?.myLabel.text  = self.usuario?.nome
            
        }

        
    }
}

extension CadastroUsuarioVC: CadastroEnderecoVCProtocol {
    

    
    func successRegisterAddress(address: Endereco) {
        
        self.enderecoView.isHidden = false
        self.usuario?.endereco = address
        
        self.ruaTextField.text = self.usuario?.endereco?.rua
        self.complementoTextField.text = self.usuario?.endereco?.complemento
        self.cidadeTextField.text = self.usuario?.endereco?.cidade
        self.bairroTextField.text = self.usuario?.endereco?.bairro
        self.estadoTextField.text = self.usuario?.endereco?.estado
        
    }
}

extension CadastroUsuarioVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        switch textField {
        case self.nomeTextField:
            self.cpfTextField.becomeFirstResponder()
        case self.cpfTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.dataTextField.becomeFirstResponder()
        default:
            self.dataTextField.resignFirstResponder()
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.validateFields(textField: textField)
    }
}


// nome
// cpf
// email
// data de nascimento
// endereço, numero, bairro, cidade, estado

// Quero objetos
// quero tratativa de return, quero validacao de campo vazio
// quero uma tela de Cadastro



