//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Matheus B. Grigoletto on 16/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

protocol MyCollectionViewCellDelegate: class {
    func goDetailEvent(evento: Evento)
}

class MyCollectionViewCell: UICollectionViewCell {

    // MARK: # IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: # Class properties
    
    weak var delegate: MyCollectionViewCellDelegate?
    
    var currentEvent: Evento?
    
    // MARK: # Class methods
    
    func setup(evento: Evento) {
        self.titleLabel.text = evento.nome
        self.backgroundImage.image = UIImage(named: evento.backgroundImageName ?? "")
        self.currentEvent = evento
    }
    
    // MARK: # LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: # IBActions
    
    @IBAction func tappedButton(_ sender: Any) {
        self.delegate?.goDetailEvent(evento: self.currentEvent!)
    }
    
}
