//
//  ViewController.swift
//  Alunos
//
//  Created by Matheus B. Grigoletto on 18/09/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var lastnameLabel: UILabel!
    //@IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var theButton: UIButton!
    
    var names: [String] = [
        "Matheus", "Pedro", "Patricia", "Beatriz"
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*self.nameLabel.text = "Matheus"
        self.nameLabel.backgroundColor = .darkGray
        
        self.lastnameLabel.text = "Grigoletto"
        self.lastnameLabel.backgroundColor = .cyan
        self.lastnameLabel.textAlignment = .left
        
        self.ageLabel.text = "30"
        self.ageLabel.backgroundColor = .magenta
        self.ageLabel.alpha = CGFloat(0.2)
        self.ageLabel.textColor = .black*/
        
        self.theButton.layer.masksToBounds = true
        self.theButton.layer.cornerRadius = 4
    }

    @IBAction func handleButtonClick(_ sender: UIButton) {
        if let name = self.names.randomElement() {
            self.nameLabel.text = name
        }
    }
    
}

