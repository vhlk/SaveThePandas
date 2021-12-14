//
//  ViewAllReviewViewController.swift
//  UIModaConsciente
//
//  Created by vh on 29/11/21.
//

import UIKit

class ViewAllReviewViewController: UIViewController, UICollectionViewDataSource {
    
    private var numOfReviews = 0;
    private var names: [String] = []
    private var reviews: [String] = []
    private var reviewsStars: [Int] = []
    private var rostos: [String] = []
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var meanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewsCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let reviewsDatabase = ReviewsDatabase()
        
        (names, reviews, reviewsStars, rostos) = reviewsDatabase.getAllReviews()
        
        let mean = reviewsDatabase.getStarsMean()
        
        setStarsByValue(star1: star1, star2: star2, star3: star3, star4: star4, star5: star5, value: mean)
        
        meanLabel.text = String(format: "%.1f", mean)
        
        numOfReviews = names.count
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
        
        setStarsByValue(star1: reviewCollectionViewCell.estrela1ImageView, star2: reviewCollectionViewCell.estrela2ImageView, star3: reviewCollectionViewCell.estrela3ImageView, star4: reviewCollectionViewCell.estrela4ImageView, star5: reviewCollectionViewCell.estrela5ImageView, value: Double(reviewsStars[indexPath.row]))
        
        return reviewCollectionViewCell
    }
    
    func setStarsByValue(star1: UIImageView, star2: UIImageView, star3: UIImageView, star4: UIImageView, star5: UIImageView, value: Double) {
        
        let golderStar = "VectorEstrelinhaHiRes"
        let emptyStar = "VectorEstrelinhaVaziaHiRes"
        
        if (value > 0) {
            star1.image = UIImage(named: golderStar)
        } else {
            star1.image = UIImage(named: emptyStar)
        }
        if (value > 1) {
            star2.image = UIImage(named: golderStar)
        } else {
            star2.image = UIImage(named: emptyStar)
        }
        if (value > 2) {
            star3.image = UIImage(named: golderStar)
        } else {
            star3.image = UIImage(named: emptyStar)
        }
        if (value > 3) {
            star4.image = UIImage(named: golderStar)
        } else {
            star4.image = UIImage(named: emptyStar)
        }
        if (value > 4) {
            star5.image = UIImage(named: golderStar)
        } else {
            star5.image = UIImage(named: emptyStar)
        }
    }

}
