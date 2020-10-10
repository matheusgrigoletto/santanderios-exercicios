//
//  ProdutoTableViewCell.swift
//  LojaVirtual
//
//  Created by Matheus B. Grigoletto on 10/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {
    
    // MARK: > IBOutlets
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    
    func setup(produto: Produto?) {
        guard let $produto = produto else { return }
        
        self.tituloLabel.text = $produto.nome
        self.subtituloLabel.text = $produto.preco
        
        self.fotoImageView.image = self.getImagem(categoria: $produto.categoria.rawValue)
    }
    
    func getImagem(categoria: Int) -> UIImage? {
        switch categoria {
        case Categorias.eletrodomesticos.rawValue:
            return UIImage(named: "eletrodomesticos.png")
        case Categorias.lazer.rawValue:
            return UIImage(named: "lazer.png")
        default:
            return UIImage(named: "eletronicos.png")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
