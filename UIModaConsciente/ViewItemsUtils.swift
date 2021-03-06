//
//  ViewItemsUtils.swift
//  UIModaConsciente
//
//  Created by vh on 06/12/21.
//

import Foundation
import UIKit

class Utils {
    static func setStarsByValue(star1: UIImageView, star2: UIImageView, star3: UIImageView, star4: UIImageView, star5: UIImageView, value: Double) {
        
        let golderStar = "VectorEstrelinhaHiRes"
        let emptyStar = "VectorEstrelinhaVaziaHiRes"
        
        if (value > 0.5) {
            star1.image = UIImage(named: golderStar)
        } else {
            star1.image = UIImage(named: emptyStar)
        }
        if (value > 1.5) {
            star2.image = UIImage(named: golderStar)
        } else {
            star2.image = UIImage(named: emptyStar)
        }
        if (value > 2.5) {
            star3.image = UIImage(named: golderStar)
        } else {
            star3.image = UIImage(named: emptyStar)
        }
        if (value > 3.5) {
            star4.image = UIImage(named: golderStar)
        } else {
            star4.image = UIImage(named: emptyStar)
        }
        if (value > 4.5) {
            star5.image = UIImage(named: golderStar)
        } else {
            star5.image = UIImage(named: emptyStar)
        }
    }
    
    static func setButtonStarsByValue(estrela1Button:UIButton, estrela2Button:UIButton, estrela3Button:UIButton, estrela4Button:UIButton, estrela5Button:UIButton, value: Double) {
        let golderStar = "VectorEstrelinhaHiRes"
        let emptyStar = "VectorEstrelinhaVaziaHiRes"
        
        if (value > 0.5) {
            estrela1Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            estrela1Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 1.5) {
            estrela2Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            estrela2Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 2.5) {
            estrela3Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            estrela3Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 3.5) {
            estrela4Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            estrela4Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
        if (value > 4.5) {
            estrela5Button.setImage(UIImage(named: golderStar), for :.normal)
        } else {
            estrela5Button.setImage(UIImage(named: emptyStar), for :.normal)
        }
    }
    
    static func setTreesByValue(tree1: UIImageView, tree2: UIImageView, tree3: UIImageView, tree4: UIImageView, tree5: UIImageView, value: Double) {
        
        if (value > 0.5) {
            tree1.isHidden = false
        } else {
            tree1.isHidden = true
        }
        if (value > 1.5) {
            tree2.isHidden = false
        } else {
            tree2.isHidden = true
        }
        if (value > 2.5) {
            tree3.isHidden = false
        } else {
            tree3.isHidden = true
        }
        if (value > 3.5) {
            tree4.isHidden = false
        } else {
            tree4.isHidden = true
        }
        if (value > 4.5) {
            tree5.isHidden = false
        } else {
            tree5.isHidden = true
        }
    }
    
    enum TypeOfBrand:String {
        case zara = "Zara"
        case riachuelo = "Riachuelo"
        case mash = "Mash"
        case reserva = "Reserva"
        case mOfficer = "M. Officer"
    }
    
    static func brand2Value(brand:TypeOfBrand) -> Int {
        switch brand {
        case .zara:
            return 1
        case .riachuelo:
            return 1
        case .mash:
            return 5
        case .reserva:
            return 4
        case .mOfficer:
            return 3
        }
    }
    
    enum TypeOfCloth:String {
        case algodao = "Algod??o"
        case poliester = "Poli??ster"
        case algodaoOrganico = "Algod??o Org??nico"
        case seda = "Seda"
        case la = "L??"
        case linho = "Linho"
        case denim = "Denim"
    }
    
    static func cloth2Value(cloth:TypeOfCloth) -> Int {
        switch cloth {
        case .algodao:
            return 4
        case .poliester:
            return 3
        case .algodaoOrganico:
            return 5
        case .seda:
            return 5
        case .la:
            return 2
        case .linho:
            return 5
        case .denim:
            return 1
        }
    }
}
