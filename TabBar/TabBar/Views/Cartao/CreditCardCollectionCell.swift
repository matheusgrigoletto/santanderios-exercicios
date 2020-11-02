//
//  CreditCardCollectionCell.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 26/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class CreditCardCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var cartao: CartaoElement?

    func setup(_ value: CartaoElement?) {
        if let $value = value {
            self.nameLabel.text = $value.nome
            self.numberLabel.text = $value.numero
            self.expLabel.text = $value.data
            self.flagImageView.image = UIImage(named: $value.bandeira)
            
            if $value.bandeira == "mastercard" {
                self.containerView.backgroundColor = UIColor.init(rgb: 0x333333)
                self.nameLabel.textColor = .lightGray
                self.numberLabel.textColor = .lightGray
                self.expLabel.textColor = .lightGray
                self.lineView.backgroundColor = .lightGray
            }
        }
        
    }
}
