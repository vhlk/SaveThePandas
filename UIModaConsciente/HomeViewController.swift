//
//  HomeViewController.swift
//  UIModaConsciente
//
//  Created by Luana Porciuncula Barreto on 05/12/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var recentViewController: UICollectionView!
    @IBOutlet weak var newsViewController: UICollectionView!
    
    var newsData = [NewsArticle]();
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
        //return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        //return newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsCollectionViewCell = newsViewController.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCollectionViewCell
        //let recentCollectionViewCell = recentViewController.dequeueReusableCell(withReuseIdentifier: "RecentCell", for: indexPath) as! RecentCollectionViewCell
        
        let imageName = newsData[indexPath.row].image
        newsCollectionViewCell.newsImage.image = UIImage(named: imageName)
        newsCollectionViewCell.newsLabel.text = newsData[indexPath.row].title
        
        return newsCollectionViewCell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recentData = DataLoader().recentClothe
        newsData = DataLoader().newsArticle
        
        print(recentData)
        print(newsData)
        
        newsViewController.dataSource = self
        //recentViewController.dataSource = self
        
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
