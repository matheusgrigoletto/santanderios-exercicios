//
//  Pessoa.swift
//  Alunos
//
//  Created by Matheus B. Grigoletto on 18/09/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Pessoa {
    
    var nome: String?
    var sobrenome: String?
    var peso: Float?
    var sexo: String?
    
    init(nome: String, sobrenome: String, sexo: String, peso: Float) {
        self.nome = nome
        self.sobrenome = sobrenome
        self.sexo = sexo
        self.peso = peso
    }
    
}

class Aluno: Pessoa {
    var matricula: String?
    var turma: String?
    var periodo: String?
    var matriculado: Bool?
    
    init(matricula: String, turma: String, periodo: String, matriculado: Bool = false) {
        super.init(nome: "", sobrenome: "", sexo: "", peso: 0.0)
        
        self.matricula = matricula
        self.turma = turma
        self.periodo = periodo
        self.matriculado = matriculado
    }
}
