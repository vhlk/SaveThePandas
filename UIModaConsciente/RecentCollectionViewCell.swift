//
//  RecentCollectionViewCell.swift
//  UIModaConsciente
//
//  Created by Luana Porciuncula Barreto on 06/12/21.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    
    var image = "Camisa"
    var brand = Utils.TypeOfBrand.mash
    var cloth = Utils.TypeOfCloth.algodao
    
    @IBOutlet weak var Ellipse: UIImageView!
    @IBOutlet weak var RecentClotheIcon: UIImageView!
    @IBOutlet weak var RecentClotheType: UITextView!
    @IBOutlet weak var RecentClotheBrand: UITextView!
    
    var functionSegue : (()->())?
    @IBAction func recentButton(_ sender: UIButton) {
        let nextItem = NextItem()
        nextItem.setNextItem(image: image, brand: brand, cloth: cloth)
        
        functionSegue?()
    }
}
