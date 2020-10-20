//
//  DetalhesViewController.swift
//  CollectionView
//
//  Created by Matheus B. Grigoletto on 19/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var evento: Evento?

    @IBOutlet weak var eventoDatailLabel: UILabel!
    
    @IBOutlet weak var eventoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.config()
    }
    
    func config() {
        self.eventoDatailLabel.text = evento?.nome
        self.eventoImageView.image = UIImage(named: evento?.backgroundImageName ?? "")
    }

}
