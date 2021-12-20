//
//  NewsCollectionViewCell.swift
//  UIModaConsciente
//
//  Created by Luana Porciuncula Barreto on 07/12/21.
//

import UIKit
import SafariServices

class NewsCollectionViewCell: UICollectionViewCell {
    var newsLink = "https://www.google.com"
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBAction func newsButton(_ sender: Any) {
        guard let url = URL(string: newsLink) else {
          return //be safe
        }
         
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
