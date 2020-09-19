import UIKit

var nome: String = "Matheus B. Grigoletto"
var idade: Int = 30;
var profissao: String = "Developer"
var sobre: String = "Analista desenvolvedor lider @ Órigo Energia; Fullstack PHP Senior Developer"
var resumo: String = "\(nome), \(idade) - \(profissao)\n\(sobre)"

print("====================")
print(resumo)
print("====================")

var carro: String? = "Civic"
var moto: String?

print("==== Optionals =====")

print(carro)
print(moto)

if let _moto = moto {
    print(_moto)
} else {
    print("Sem valor definido")
}

moto = "Ducati Sena"

if let _moto = moto {
    print(_moto)
}
