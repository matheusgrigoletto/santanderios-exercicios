//
//  Cartao.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 26/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

struct Cartoes: Codable {
    let cartoes: [CartaoElement]
}

struct CartaoElement: Codable {
    let id, nome, data, numero, bandeira: String
}
