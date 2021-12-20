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
}
