import UIKit

for index in 1...10 {
    var num = 0
    while num <= 10 {
        print("\(index) x \(num) = \(index * num)")
        num += 1
    }
    print("\n============\n")
}

print("\n===== Exercicio pessoas sem array ======\n")

var nome: String
var idade: Int
var peso: Float

for num in 1...4 {
    
    switch num {
    case 1:
        nome = "John Doe"
        idade = 32
        peso = 90.6
    case 2:
        nome = "Mark Thompson"
        idade = 36
        peso = 92.1
    case 3:
        nome = "Lucy Lane"
        idade = 29
        peso = 67.24
    default:
        nome = "Jane Bar"
        idade = 28
        peso = 75.2
    }
    
    print("\n============\n")
    print("\(nome), \(idade) - peso: \(peso)Kg")
    print("\n============\n")
    
}
