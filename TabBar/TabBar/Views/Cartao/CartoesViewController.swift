//
//  SecondViewController.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 23/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class CartoesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var cartoes: Cartoes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CreditCardContainerCell", bundle: nil), forCellReuseIdentifier: "CreditCardContainerCell")

        print("=====@ CreditCardViewController @=====")
        
        self.cartoes = self.loadCreditCards()
        
        if let _cartoes = self.cartoes {
            print(_cartoes)
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }
    
    private func loadCreditCards() -> Cartoes? {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let cartoes = try JSONDecoder().decode(Cartoes.self, from: data)
                
                
                return cartoes
            } catch {
                print("🥴 O parse dos cartão faiô")
                return nil
            }

        }
        
        return nil
    }

}

extension CartoesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CreditCardContainerCell? = tableView.dequeueReusableCell(withIdentifier: "CreditCardContainerCell", for: indexPath) as? CreditCardContainerCell
        
        cell?.setup(self.cartoes!)
        
        return cell ?? UITableViewCell()
    }
    
    
}
