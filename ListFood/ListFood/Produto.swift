//
//  Produto.swift
//  ListFood
//
//  Created by Matheus B. Grigoletto on 01/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Produto {
    var nome: String?
    var categoria: CategoriaEnum?
    var peso: Float?
    var preco: Float?
    var vegano: Bool?
    
    init(nome: String?, categoria: CategoriaEnum?, peso: Float?, preco: Float?, vegano: Bool?) {
        self.nome = nome
        self.categoria = categoria
        self.peso = peso
        self.preco = preco
        self.vegano = vegano
    }
    
}
