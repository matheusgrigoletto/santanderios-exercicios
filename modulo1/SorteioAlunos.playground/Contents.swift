import UIKit

var arrayNomesAlunos:[String] = [
   "Rafael José da silva",
   "AITCHEOU GAUTHIER ZOUNTCHEGNON",
   "André Lucas Pereira Venceslau",
   "Bruna Tokie Ebina",
   "Bruno Diegues",
   "Bruno Fonseca",
   "Bruno Freire da Silva",
   "Bruno Nascimento",
   "Bryan Barreto",
   "Carla Mendanha",
   "Catia Souza",
   "Dayana Prado",
   "Erik Radicheski da Silva",
   "Fernando de Cerqueira Crelick",
   "Gabriel Duarte",
   "Gustavo Ferreira",
   "Augusto Rocha",
   "João Pedro Giarrante",
   "Juan Souza",
   "Junior Fernandes",
   "Karen Makihara",
   "Letícia Câmara",
   "Lidiane Gomes Barbosa",
   "Lucas Santiago do Nascimento",
   "Luciano araujo do cabo pinho",
   "Marcelo Buligon",
   "Matheus Bastelli Grigoletto",
   "Nathália Santos",
   "Patrícia Cardozo",
   "Paulo Vieira",
   "Rafael Nascimento Sampaio",
   "Rafael V dos Santos",
   "Renan Vicente de Farias",
   "Renato Silva",
   "Rhenan Garcia",
   "Rodolpho Maia",
   "Rodrigo Cesar Ventura da Silva",
   "Bruno Horta",
   "Thais Nicodemus",
   "Timoteo Holanda",
   "Vanessa Montagner",
   "Thiago Jatobá"
]

arrayNomesAlunos.shuffle()

var grupos: [Int:[String]] = Dictionary<Int, Array<String>>()
var grupoIndex = 0
var alunos = Array<String>()

for index in 0..<arrayNomesAlunos.count {
    if index != 0 && index % 6 == 0 {
        grupos[grupoIndex] = alunos
        grupoIndex += 1
        alunos = []
    }
    alunos.append(arrayNomesAlunos[index])
}

for (index, elem) in grupos.enumerated() {
    print("Grupo \(index + 1)")
    print("------------------")
    print(elem.value.sorted())
    print("==================")
}
