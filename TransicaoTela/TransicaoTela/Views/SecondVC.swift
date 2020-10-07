//
//  SecondVC.swift
//  TransicaoTela
//
//  Created by Matheus B. Grigoletto on 23/09/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBAction func handleBackButton(_ sender: UIButton) {
        self.dismiss(animated: true) {
            print("SecondVC dismiss")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("0 SecondVC viewDidLoad")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("2 SecondVC viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1 SecondVC viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("3 SecondVC viewWillDisappear")
    }
    
}
