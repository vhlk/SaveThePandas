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
    private var itemId: Int = 0
    
    @IBOutlet weak var reviewsCollectionView: UICollectionView!
    @IBOutlet weak var reviewStar1ImageView: UIImageView!
    @IBOutlet weak var reviewStar2ImageView: UIImageView!
    @IBOutlet weak var reviewStar3ImageView: UIImageView!
    @IBOutlet weak var reviewStar4ImageView: UIImageView!
    @IBOutlet weak var reviewStar5ImageView: UIImageView!
    @IBOutlet weak var reviewMeanLabel: UITextField!
    @IBOutlet weak var reviewStar1Button: UIButton!
    @IBOutlet weak var reviewStar2Button: UIButton!
    @IBOutlet weak var reviewStar3Button: UIButton!
    @IBOutlet weak var reviewStar4Button: UIButton!
    @IBOutlet weak var reviewStar5Button: UIButton!
    var numSelectedReviews = 0
    
    @IBOutlet weak var itemPhrase: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTree1: UIImageView!
    @IBOutlet weak var itemTree2: UIImageView!
    @IBOutlet weak var itemTree3: UIImageView!
    @IBOutlet weak var itemTree4: UIImageView!
    @IBOutlet weak var itemTree5: UIImageView!
    @IBOutlet weak var itemTreePhrase: UILabel!
    @IBOutlet weak var itemBrandLabel: UILabel!
    @IBOutlet weak var itemBrandEmoti: UIImageView!
    @IBOutlet weak var itemMaterialLabel: UILabel!
    @IBOutlet weak var itemMateralEmoti: UIImageView!
    
    @IBAction func set1StarReview(_ sender: Any) {
        numSelectedReviews = 1
        Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: 1)
        performSegue(withIdentifier: "PresentReviewPage", sender: self)
    }
    @IBAction func set2StarsReview(_ sender: Any) {
        numSelectedReviews = 2
        Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: 2)
        performSegue(withIdentifier: "PresentReviewPage", sender: self)
    }
    @IBAction func set3StarsReview(_ sender: Any) {
        numSelectedReviews = 3
        Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: 3)
        performSegue(withIdentifier: "PresentReviewPage", sender: self)
    }
    @IBAction func set4StarsReview(_ sender: Any) {
        numSelectedReviews = 4
        Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: 4)
        performSegue(withIdentifier: "PresentReviewPage", sender: self)
    }
    @IBAction func set5StarsReview(_ sender: Any) {
        numSelectedReviews = 5
        Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: 5)
        performSegue(withIdentifier: "PresentReviewPage", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItemData()
        loadCollectionViewData()
    }
    
    func loadItemData() {
        let nextItem = NextItem()
        if let (image, marca, material, id) = nextItem.getNextItem() {
            self.title = image
            self.itemId = id
            itemImage.image = UIImage(named: image)
            itemBrandLabel.text = "Marca: \(marca.rawValue)"
            itemMaterialLabel.text = "Material: \(material.rawValue)"
            
            let brandRating = Utils.brand2Value(brand: marca)
            let clothRating = Utils.cloth2Value(cloth: material)
            
            let happyEmoti = "Group 6"
            let midEmoti = "Group 9"
            let unhappyEmoti = "frown - EmotiTriste"
            
            if brandRating >= 4 {
                itemBrandEmoti.image = UIImage(named: happyEmoti)
            } else if brandRating >= 3 {
                itemBrandEmoti.image = UIImage(named: midEmoti)
            } else {
                itemBrandEmoti.image = UIImage(named: unhappyEmoti)
            }
            
            if clothRating >= 4 {
                itemMateralEmoti.image = UIImage(named: happyEmoti)
            } else if brandRating >= 3 {
                itemMateralEmoti.image = UIImage(named: midEmoti)
            } else {
                itemMateralEmoti.image = UIImage(named: unhappyEmoti)
            }
            
            let itemRating = Double(brandRating + clothRating) / 2.0 // 0 a 5
            
            if (itemRating > 3) {
                itemPhrase.text = "Os bichos-pregui??a continuar??o abrigados com essa compra!"
            } else {
                itemPhrase.text = "Os bichos-pregui??a estar??o perdendo suas casinhas com essa compra :("
            }
            
            Utils.setTreesByValue(tree1: itemTree1, tree2: itemTree2, tree3: itemTree3, tree4: itemTree4, tree5: itemTree5, value: Double(itemRating))
            
            itemTreePhrase.text = "Essa pe??a ?? \(Int(itemRating*2*10))% mais consciente que a m??dia da categoria."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsCollectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(NewLastReview(_:)), name: Notification.Name(rawValue: "NewLastReview"), object: nil)
    }
    
    @objc func NewLastReview(_ notification: Notification) {
        loadCollectionViewData()
    }
    
    func loadCollectionViewData() {
        let reviewsDatabase = ReviewsDatabase()
        
        (names, reviews, reviewsStars, rostos) = reviewsDatabase.getReviewsById(id: itemId)
        
        if reviewsStars.isEmpty {
            reviewMeanLabel.text = String(format: "%.1f", 0.0)
            Utils.setStarsByValue(star1: reviewStar1ImageView, star2: reviewStar2ImageView, star3: reviewStar3ImageView, star4: reviewStar4ImageView, star5: reviewStar5ImageView, value: 0.0)
        } else {
            let mean = reviewsDatabase.getStarsMeanById(id: itemId)
            reviewMeanLabel.text = String(format: "%.1f", mean)
            Utils.setStarsByValue(star1: reviewStar1ImageView, star2: reviewStar2ImageView, star3: reviewStar3ImageView, star4: reviewStar4ImageView, star5: reviewStar5ImageView, value: mean)
        }
        
        numOfReviews = names.count
        
        self.reviewsCollectionView.reloadData()
        
        let lastReview = LastReview()
        if let (_, _, star, _, id) = lastReview.getLastReview() {
            if self.itemId == id {
                numSelectedReviews = star
                Utils.setButtonStarsByValue(estrela1Button: reviewStar1Button, estrela2Button: reviewStar2Button, estrela3Button: reviewStar3Button, estrela4Button: reviewStar4Button, estrela5Button: reviewStar5Button, value: Double(star))
            }
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PresentReviewPage") {
            let reviewPage = segue.destination as! PopUpViewController
            
            reviewPage.numOfStars = numSelectedReviews
            
        }
    }
}
