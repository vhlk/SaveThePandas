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
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                var imagePicker = UIImagePickerController()
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
            
            return newsCollectionViewCell
        } else {
            let recentCollectionViewCell = recentViewController.dequeueReusableCell(withReuseIdentifier: "RecentCell", for: indexPath) as! RecentCollectionViewCell
            let Ellipse = "Ellipse 2"
            recentCollectionViewCell.Ellipse.image = UIImage(named: Ellipse)
            recentCollectionViewCell.RecentClotheType.text = recentData[indexPath.row].type
            recentCollectionViewCell.RecentClotheBrand.text = recentData[indexPath.row].name
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
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 384, height: 130)
    }
}
