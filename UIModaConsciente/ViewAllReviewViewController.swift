//
//  ViewAllReviewViewController.swift
//  UIModaConsciente
//
//  Created by vh on 29/11/21.
//

import UIKit

class ViewAllReviewViewController: UIViewController, UICollectionViewDataSource {
    
    var numOfReviews = 3;
    var names = ["Ana Paula", "Joana De Arc", "Pero Cabral"]
    var reviews = ["Loved it!", "Great!", "Love"]
    var reviewsStars = [5, 4, 5]
    var rostos = ["Ellipse 3 - carinhaMulher", "Ellipse 3 - carinhaHomem", "Ellipse 3"]
    
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfReviews
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reviewCollectionViewCell = reviewsCollectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewsCollectionViewCell
        
        reviewCollectionViewCell.nameTextView.text = names[indexPath.row]
        reviewCollectionViewCell.reviewTextView.text = reviews[indexPath.row]
        
        reviewCollectionViewCell.rostoImageView.image = UIImage(named: rostos[indexPath.row])
        
        let golderStar = "VectorEstrelaDourada"
        let emptyStar = "VectorEstrelaVazia"
        if (reviewsStars[indexPath.row] > 0) {
            reviewCollectionViewCell.estrela1ImageView.image = UIImage(named: golderStar)
        } else {
            reviewCollectionViewCell.estrela1ImageView.image = UIImage(named: emptyStar)
        }
        if (reviewsStars[indexPath.row] > 1) {
            reviewCollectionViewCell.estrela2ImageView.image = UIImage(named: golderStar)
        } else {
            reviewCollectionViewCell.estrela2ImageView.image = UIImage(named: emptyStar)
        }
        if (reviewsStars[indexPath.row] > 2) {
            reviewCollectionViewCell.estrela3ImageView.image = UIImage(named: golderStar)
        } else {
            reviewCollectionViewCell.estrela3ImageView.image = UIImage(named: emptyStar)
        }
        if (reviewsStars[indexPath.row] > 3) {
            reviewCollectionViewCell.estrela4ImageView.image = UIImage(named: golderStar)
        } else {
            reviewCollectionViewCell.estrela4ImageView.image = UIImage(named: emptyStar)
        }
        if (reviewsStars[indexPath.row] > 4) {
            reviewCollectionViewCell.estrela5ImageView.image = UIImage(named: golderStar)
        } else {
            reviewCollectionViewCell.estrela5ImageView.image = UIImage(named: emptyStar)
        }
        
        return reviewCollectionViewCell
    }

}
