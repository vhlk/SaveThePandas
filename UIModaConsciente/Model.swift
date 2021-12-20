//
//  Model.swift
//  UIModaConsciente
//
//  Created by vh on 04/12/21.
//

import Foundation

class ReviewsDatabase {
    private let namesDefaults = "PeopleNames"
    private let reviewsDefaults = "PeopleReviews"
    private let reviewsStarsDefaults = "ReviewsStars"
    private let peopleFacesDefaults = "PeopleFaces"
    private let itemsIdsDefaults = "ItemID"

    private var names: [String]
    private var reviews: [String]
    private var stars: [Int]
    private var faces: [String]
    private var ids: [Int]
    
    init() {
        names = (UserDefaults.standard.array(forKey: namesDefaults) ?? [String]()) as! [String]
        reviews = (UserDefaults.standard.array(forKey: reviewsDefaults)  ?? [String]()) as! [String]
        stars = (UserDefaults.standard.array(forKey: reviewsStarsDefaults) ?? [Int]()) as! [Int]
        faces = (UserDefaults.standard.array(forKey: peopleFacesDefaults) ?? [String]()) as! [String]
        ids = (UserDefaults.standard.array(forKey: itemsIdsDefaults) ?? [Int]()) as! [Int]
    }
    
    func addReview(usrName: String, review: String, stars: Int, usrPhotoName: String, itemID: Int) {
        self.names.insert(usrName, at: 0)
        self.reviews.insert(review, at: 0)
        self.stars.insert(stars, at: 0)
        self.faces.insert(usrPhotoName, at: 0)
        self.ids.insert(itemID, at: 0)
        
        UserDefaults.standard.setValue(self.names, forKey: namesDefaults)
        UserDefaults.standard.set(self.reviews, forKey: reviewsDefaults)
        UserDefaults.standard.set(self.stars, forKey: reviewsStarsDefaults)
        UserDefaults.standard.set(self.faces, forKey: peopleFacesDefaults)
        UserDefaults.standard.set(self.ids, forKey: itemsIdsDefaults)
    }
    
    func getAllReviews() -> (names: [String], reviews: [String], stars: [Int], faces: [String], ids: [Int]) {
        return (names, reviews, stars, faces, ids)
    }
    
    func getReviewsById(id:Int) -> (names: [String], reviews: [String], stars: [Int], faces: [String]) {
        
        var names:[String] = []
        var reviews:[String] = []
        var stars:[Int] = []
        var faces:[String] = []
        
        for (i, currId) in ids.enumerated() {
            if (currId == id) {
                names.append(self.names[i])
                reviews.append(self.reviews[i])
                stars.append(self.stars[i])
                faces.append(self.faces[i])
            }
        }
        
        return (names, reviews, stars, faces)
    }
    
    func getStarsMean() -> Double {
        return Double(stars.reduce(0, +)) / Double(stars.count)
    }
    
    func getStarsMeanById(id:Int) -> Double {
        let (_, _, reviewsStars, _) = getReviewsById(id: id)
        return Double(reviewsStars.reduce(0, +)) / Double(reviewsStars.count)
    }
}

class LastReview {
    private let nameDefaults = "LastName"
    private let reviewDefaults = "LastReview"
    private let reviewStarsDefaults = "LastStars"
    private let faceDefaults = "LastFace"
    private let itemIdDefaults = "LastID"
    
    private var name = ""
    private var review = ""
    private var star = 0
    private var face = ""
    private var id = 0
    
    init() {
        name = (UserDefaults.standard.string(forKey: nameDefaults) ?? "")
        review = (UserDefaults.standard.string(forKey: reviewDefaults) ?? "")
        star = (UserDefaults.standard.integer(forKey: reviewStarsDefaults))
        face = (UserDefaults.standard.string(forKey: faceDefaults) ?? "")
        id = (UserDefaults.standard.integer(forKey: itemIdDefaults))
    }
    
    func getLastReview() -> (name: String, review: String, star: Int, face: String, id: Int)?
    {
        if name == "" {
            return nil
        }
        
        return (name, review, star, face, id)
    }
    
    func setLastReview(name:String, review:String, star:Int, face:String, id:Int)
    {
        self.name = name
        self.review = review
        self.star = star
        self.face = face
        self.id = id
        
        UserDefaults.standard.setValue(self.name, forKey: nameDefaults)
        UserDefaults.standard.set(self.review, forKey: reviewDefaults)
        UserDefaults.standard.set(self.star, forKey: reviewStarsDefaults)
        UserDefaults.standard.set(self.face, forKey: faceDefaults)
        UserDefaults.standard.set(self.id, forKey: itemIdDefaults)
    }
    
}

class NextItem {
    private let imageDefaults = "ImagemItem"
    private let brandDefaults = "MarcaItem"
    private let clothDefaults = "MaterialItem"
    private let itemIdDefaults = "NextID"
    
    private var image = ""
    private var marca = ""
    private var material = ""
    private var id = 0
    
    init() {
        image = (UserDefaults.standard.string(forKey: imageDefaults) ?? "")
        marca = (UserDefaults.standard.string(forKey: brandDefaults) ?? "")
        material = (UserDefaults.standard.string(forKey: clothDefaults) ?? "")
        id = (UserDefaults.standard.integer(forKey: itemIdDefaults))
    }
    
    func setNextItem(image: String, brand: Utils.TypeOfBrand, cloth: Utils.TypeOfCloth, id: Int) {
        self.image = image
        self.marca = brand.rawValue
        self.material = cloth.rawValue
        self.id = id
    
        UserDefaults.standard.set(self.image, forKey: imageDefaults)
        UserDefaults.standard.set(self.marca, forKey: brandDefaults)
        UserDefaults.standard.set(self.material, forKey: clothDefaults)
        UserDefaults.standard.set(self.id, forKey: itemIdDefaults)
    }
    
    func getNextItem() -> (image: String, brand: Utils.TypeOfBrand, cloth: Utils.TypeOfCloth, id: Int)? {
        if marca == "" {
            return nil
        }
        
        let brand = Utils.TypeOfBrand(rawValue: marca)!
        let mater = Utils.TypeOfCloth(rawValue: material)!
        
        return (image, brand, mater, id)
    }
    
    func resetNextItem() {
        marca = ""
        UserDefaults.standard.set("", forKey: brandDefaults)
    }
}
