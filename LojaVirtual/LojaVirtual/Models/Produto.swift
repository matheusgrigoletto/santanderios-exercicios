//
//  Produto.swift
//  LojaVirtual
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

struct Produto {
    let nome: String?
    let preco: String?
    let categoria: Categorias
}

enum Categorias: Int {
    case eletronicos = 0
    case lazer = 1
    case eletrodomesticos = 2
}
