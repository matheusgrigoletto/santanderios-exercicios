//
//  ViewController.swift
//  CollectionView
//
//  Created by Matheus B. Grigoletto on 16/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var arrayEventos: [Evento] = [
        Evento(nome: "Evento #1", backgroundImageName: "image1.jpg"),
        Evento(nome: "Evento #2", backgroundImageName: "image2.jpg"),
        Evento(nome: "Evento #3", backgroundImageName: "image3.jpg"),
        Evento(nome: "Evento #4", backgroundImageName: "image4.jpg"),
    ]
    
    fileprivate func initConfig() {
        self.myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        self.myCollectionView.dataSource = self
        self.myCollectionView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initConfig()
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayEventos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell
        
        cell?.setup(evento: self.arrayEventos[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.arrayEventos[indexPath.row].nome!)
    }
}
