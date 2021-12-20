//
//  ViewItemViewController.swift
//  UIModaConsciente
//
//  Created by vh on 23/11/21.
//

import UIKit

class ViewItemViewController: UIViewController, UICollectionViewDataSource {
    
    private var numOfReviews = 0;
    private var names: [String] = []
    private var reviews: [String] = []
    private var reviewsStars: [Int] = []
    private var rostos: [String] = []
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var reviewStar1ImageView: UIImageView!
    @IBOutlet weak var reviewStar2ImageView: UIImageView!
    @IBOutlet weak var reviewStar3ImageView: UIImageView!
    @IBOutlet weak var reviewStar4ImageView: UIImageView!
    @IBOutlet weak var reviewStar5ImageView: UIImageView!
    @IBOutlet weak var reviewMeanLabel: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        let reviewsDatabase = ReviewsDatabase()
        
        (names, reviews, reviewsStars, rostos) = reviewsDatabase.getAllReviews()
        
        let mean = reviewsDatabase.getStarsMean()
        
        Utils.setStarsByValue(star1: reviewStar1ImageView, star2: reviewStar2ImageView, star3: reviewStar3ImageView, star4: reviewStar4ImageView, star5: reviewStar5ImageView, value: mean)
        
        reviewMeanLabel.text = String(format: "%.1f", mean)
        
        numOfReviews = names.count
        
        self.reviewsCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(5, numOfReviews)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reviewCollectionViewCell = reviewsCollectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath) as! ReviewsCollectionViewCell
        
        reviewCollectionViewCell.nameTextView.text = names[indexPath.row]
        reviewCollectionViewCell.reviewTextView.text = reviews[indexPath.row]
        
        reviewCollectionViewCell.rostoImageView.image = UIImage(named: rostos[indexPath.row])
        
        Utils.setStarsByValue(star1: reviewCollectionViewCell.estrela1ImageView, star2: reviewCollectionViewCell.estrela2ImageView, star3: reviewCollectionViewCell.estrela3ImageView, star4: reviewCollectionViewCell.estrela4ImageView, star5: reviewCollectionViewCell.estrela5ImageView, value: Double(reviewsStars[indexPath.row]))
        
        return reviewCollectionViewCell
    }
}
