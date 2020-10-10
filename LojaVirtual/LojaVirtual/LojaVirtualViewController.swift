//
//  LojaVirtualViewController.swift
//  LojaVirtual
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class LojaVirtualViewController: UIViewController {

    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias: [String] = ["Eletrônicos", "Lazer", "Eletrodomésticos"]
    
    var produtos: [Produto] = [
        Produto(nome: "Macbook Air", preco: "R$ 14.000,00", categoria: .eletronicos),
        Produto(nome: "iPhone", preco: "R$ 8.000,00", categoria: .eletronicos),
        Produto(nome: "Notebook Dell", preco: "R$ 6.650,00", categoria: .eletronicos),
        
        Produto(nome: "Bicicleta", preco: "R$ 400,00", categoria: .lazer),
        Produto(nome: "Bola de futebol", preco: "R$ 90,00", categoria: .lazer),
        
        Produto(nome: "Geladeira", preco: "R$ 1.200,00", categoria: .eletrodomesticos),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
    }
    
    private func configTableView() {
        self.produtosTableView.dataSource = self
        self.produtosTableView.delegate = self
        self.produtosTableView.tableFooterView = UIView(frame: .zero)
        
        // registrar a TableViewCell, qual xib utilizar para renderizar as linhas da TableView
        self.produtosTableView.register(UINib(nibName: "ProdutoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProdutoTableViewCell")
    }
    
    private func numberOfItensPerCategory(section: Int) -> Int {
        let arrayProdutosFiltrados: [Produto] = self.loadFilteredArray(section: section)
        
        return arrayProdutosFiltrados.count
    }
    
    private func loadFilteredArray(section: Int) -> [Produto] {
        return self.produtos.filter({ $0.categoria.rawValue == section })
    }

}

// MARK: > Table View Data Source

extension LojaVirtualViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfItensPerCategory(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProdutoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "ProdutoTableViewCell", for: indexPath) as? ProdutoTableViewCell
        
        let arrayProdutosFiltrados: [Produto] = self.loadFilteredArray(section: indexPath.section)
        
        cell?.setup(produto: arrayProdutosFiltrados[indexPath.row])

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.categorias[section]
    }
}

extension LojaVirtualViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
