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
    private var itemId:Int = 0
    
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
        let nextItem = NextItem()
        if let (_, _, _, id) = nextItem.getNextItem() {
            self.itemId = id
        }
        
        reloadCollectionViewData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewReview(_:)), name: Notification.Name(rawValue: "NewReview"), object: nil)
    }
    
    @objc func NewReview(_ notification: Notification) {
        reloadCollectionViewData()
    }
    
    func reloadCollectionViewData() {
        let reviewsDatabase = ReviewsDatabase()
        
        (names, reviews, reviewsStars, rostos) = reviewsDatabase.getReviewsById(id: itemId)
        
        if reviewsStars.isEmpty {
            meanLabel.text = String(format: "%.1f", 0.0)
            Utils.setStarsByValue(star1: star1, star2: star2, star3: star3, star4: star4, star5: star5, value: 0.0)
        } else {
            let mean = reviewsDatabase.getStarsMeanById(id: itemId)
            meanLabel.text = String(format: "%.1f", mean)
            Utils.setStarsByValue(star1: star1, star2: star2, star3: star3, star4: star4, star5: star5, value: mean)
        }
        
        numOfReviews = names.count
        
        self.reviewsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfReviews
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
