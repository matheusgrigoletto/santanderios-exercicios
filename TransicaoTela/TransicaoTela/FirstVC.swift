//
//  FirstVC.swift
//  TransicaoTela
//
//  Created by Matheus B. Grigoletto on 23/09/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

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
}
