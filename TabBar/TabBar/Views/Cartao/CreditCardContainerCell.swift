//
//  CreditCardContainerCell.swift
//  TabBar
//
//  Created by Matheus B. Grigoletto on 26/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class CreditCardContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cartoes: Cartoes?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setup(_ value: Cartoes) {
        self.collectionView.register(UINib(nibName: "CreditCardCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CreditCardCollectionCell")
        self.cartoes = value
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension CreditCardContainerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cartoes?.cartoes.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CreditCardCollectionCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "CreditCardCollectionCell", for: indexPath) as? CreditCardCollectionCell
        
        cell?.setup(cartoes?.cartoes[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
