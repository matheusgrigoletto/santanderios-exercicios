import UIKit

var myDic:[String:Any] = [
    "nome": "Matheus",
    "sobrenome": "Grigoletto",
    "profissao": "iOS / Flutter / React / PHP Developer",
]

print(myDic)

myDic["aluno"] = true

myDic.updateValue("Argo", forKey: "veiculo")

print(myDic)

myDic.removeValue(forKey: "veiculo")

print(myDic)

var arrayDeDicionarios: [[String:String]] = [
    ["nome": "Matheus", "sobrenome": "Grigoletto"],
    ["nome": "John", "sobrenome": "Doe"],
    ["nome": "Jane", "sobrenome": "Done"],
];

for (index, element) in arrayDeDicionarios.enumerated() {
    print("\(index)")
    
    if let nome = element["nome"] {
        print(nome)
    }
    
    print("==========\n")
}
