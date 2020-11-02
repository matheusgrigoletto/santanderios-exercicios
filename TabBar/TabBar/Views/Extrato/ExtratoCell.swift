//
//  ExtratoCell.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 23/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ExtratoCell: UITableViewCell {
    
    // MARK: #IBOutlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    // MARK: #LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ value: LancamentoElement?) {
        guard let $value = value else { return }
        
        self.descriptionLabel.text = $value.nome
        
        if $value.tipo == "E" {
            self.valueLabel.text = moneyFormat($value.valor)
            self.iconImage.tintColor = UIColor.init(rgb: 0x99f3bd)
            self.iconImage.image = UIImage.init(systemName: "arrow.down.square.fill")
        } else {
            self.valueLabel.text = moneyFormat(-$value.valor)
            self.iconImage.tintColor = UIColor.init(rgb: 0xf05454)
            self.iconImage.image = UIImage.init(systemName: "arrow.up.square.fill")
        }
    }
    
}
