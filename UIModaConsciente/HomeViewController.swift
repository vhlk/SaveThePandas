//
//  HomeViewController.swift
//  UIModaConsciente
//
//  Created by Luana Porciuncula Barreto on 05/12/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recentViewController: UICollectionView!
    @IBOutlet weak var newsViewController: UICollectionView!
    
    var newsData = [NewsArticle]();
    var recentData = [RecentClothe]();
    
    
    @IBAction func openCamera(_ sender: Any) {
        let nextItem = NextItem()
        nextItem.resetNextItem()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        else {
            performSegue(withIdentifier: "ShowImageViewCamera", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == newsViewController) {
            return newsData.count
        } else {
            return recentData.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == newsViewController)
        {
            let newsCollectionViewCell = newsViewController.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
            
            let imageName = newsData[indexPath.row].image
            newsCollectionViewCell.newsImage.image = UIImage(named: imageName)
            newsCollectionViewCell.newsLabel.text = newsData[indexPath.row].title
            newsCollectionViewCell.newsLink = newsData[indexPath.row].link
        
            return newsCollectionViewCell
        } else {
            let recentCollectionViewCell = recentViewController.dequeueReusableCell(withReuseIdentifier: "RecentCell", for: indexPath) as! RecentCollectionViewCell
            let Ellipse = "Ellipse 2"
            let brandName = recentData[indexPath.row].name
            let clothType = recentData[indexPath.row].cloth
            let typeImage = recentData[indexPath.row].type
            recentCollectionViewCell.Ellipse.image = UIImage(named: Ellipse)
            recentCollectionViewCell.RecentClotheType.text = recentData[indexPath.row].type
            recentCollectionViewCell.RecentClotheBrand.text = brandName
            recentCollectionViewCell.brand = Utils.TypeOfBrand(rawValue: brandName) ?? Utils.TypeOfBrand.mash
            recentCollectionViewCell.cloth = Utils.TypeOfCloth(rawValue: clothType) ?? Utils.TypeOfCloth.poliester
            recentCollectionViewCell.image = typeImage
            recentCollectionViewCell.id = recentData[indexPath.row].id
            var icon = ""
            
            switch recentData[indexPath.row].type
            {
            case "Camisa":
                icon = "icon - camisa"
            case "Calça":
                icon = "icon - calca"
            case "Saia":
                icon = "icon - saia"
            case "Vestido":
                icon = "icon - vestido"
            default:
                icon = "icon - camisa"
            }
            
            recentCollectionViewCell.RecentClotheIcon.image = UIImage(named: icon)
            
            recentCollectionViewCell.functionSegue = {
                self.performSegue(withIdentifier: "ShowTelaItemPrincipalID", sender: self)
            }
            
            return recentCollectionViewCell
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recentData = DataLoader().recentClothe
        newsData = DataLoader().newsArticle
        
        //print(recentData)
        //print(newsData)
        
        newsViewController.dataSource = self
        recentViewController.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
            super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 384, height: 130)
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue
 
              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}
