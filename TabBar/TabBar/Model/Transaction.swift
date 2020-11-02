//
//  Transaction.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 23/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

struct Transaction: Codable {
    let lancamentos: [LancamentoElement]
    let saldo: Double
}

struct LancamentoElement: Codable {
    let id, nome, data, tipo: String
    let valor: Double
}
