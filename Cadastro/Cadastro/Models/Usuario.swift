//
//  Usuario.swift
//  Cadastro
//
//  Created by Matheus B. Grigoletto on 07/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Usuario {
    var nome: String?
    var cpf: String?
    var email: String?
    var dataNascimento: String?
    var endereco: Endereco?
    
    func setNome(_ nome: String) {
        self.nome = nome
    }
    
    func setCPF(_ cpf: String) {
        self.cpf = cpf
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setDataNascimento(_ dataNascimento: String) {
        self.dataNascimento = dataNascimento
    }
    
    func setEndereco(logradouro: String, numero: String, bairro: String, cidade: String, estado: String) {
        self.endereco = Endereco(logradouro: logradouro, numero: numero, bairro: bairro, cidade: cidade, estado: estado)
    }
}
