//
//  Endereco.swift
//  Cadastro
//
//  Created by Matheus B. Grigoletto on 07/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Endereco {
    var logradouro: String?
    var numero: String?
    var bairro: String?
    var cidade: String?
    var estado: String?
    
    init(logradouro: String, numero: String, bairro: String, cidade: String, estado: String) {
        self.logradouro = logradouro
        self.numero = numero
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
    }
}
