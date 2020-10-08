//
//  FirstVC.swift
//  TransicaoTela
//
//  Created by Matheus B. Grigoletto on 23/09/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    let DetailVCSegue: String = "DetailVCSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        print("0 FirstVC viewDidLoad")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("2 FirstVC viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1 FirstVC viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("3 FirstVC viewWillDisappear")
    }
    
    @IBAction func tappedDetailVCButton(_ sender: UIButton) {
        // vai para outra tela
        self.performSegue(withIdentifier: self.DetailVCSegue, sender: "Valor transicionado")
        
        // outra forma de chamar: (nem sempre recomendada, mas se encontra por aí no mercado)
        // aqui as Outlets da ViewController não vão estar inicializadas
        // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // let vc: SecondVC? = storyboard.instantiateViewController(identifier: "SecondVC") as? SecondVC
        // self.present(vc ?? UIViewController(), animated: true, completion: nil)
    }
    
    // middleware chamado antes de `performSegue`
    // sempre será disparado, independente de qual Segue, por
    // isso é importante verificar pra qual tela vc quer ir
    // atraves de segue.identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // como é teste e eu SEI que vai pra DetailVC (no caso também pode ser SecondVC, mas quando forço a ser DetailVC, retorna nil, não executando as outras linhas abaixo)
        let vc: DetailVC? = segue.destination as? DetailVC
        vc?.view.backgroundColor = .systemRed
        
        var text: String = "Texto alterado no\nFirstVC.prepare(for segue)\n"
        
        // veio do sender do `performSegue`
        if let senderReceived = sender as? String {
            text += senderReceived
        }
        
        vc?.titleLabel.text = text
    }
}
