//
//  ViewController.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 23/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ExtratoViewController: UIViewController {

    @IBOutlet weak var timelineTableView: UITableView!
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var verSaldoButton: UIButton!
    
    var arrayLancamentos: [LancamentoElement] = []
    
    var isSaldoVisible: Bool = true
    var saldo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("=====@ ExtratoViewController @=====")
        
        self.timelineTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
        self.arrayLancamentos = self.loadMovimentacoes() ?? []
        
        self.timelineTableView.delegate = self
        self.timelineTableView.dataSource = self
        self.timelineTableView.separatorStyle = .none
    }
    
    private func loadMovimentacoes() -> [LancamentoElement]? {
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let movimentacao = try JSONDecoder().decode(Transaction.self, from: data)
                
                self.saldo = moneyFormat(movimentacao.saldo)
                
                return movimentacao.lancamentos
            } catch {
                print("🥴 O parse faiô")
                return nil
            }

        }
        
        return nil
    }
    
    @IBAction func tappedVerSaldoButton(_ sender: UIButton) {
        // esconder
        if self.isSaldoVisible {
            self.saldoLabel.textColor = .darkGray
            self.saldoLabel.text = "R$ ••••••••"
            self.verSaldoButton.setImage(UIImage.init(systemName: "eye.slash"), for: .normal)
        } else {
            self.saldoLabel.textColor = .black
            self.saldoLabel.text = self.saldo
            self.verSaldoButton.setImage(UIImage.init(systemName: "eye"), for: .normal)
        }
        self.isSaldoVisible = !isSaldoVisible
    }
    

}

extension ExtratoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayLancamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExtratoCell? = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as? ExtratoCell
        
        cell?.setup(self.arrayLancamentos[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
