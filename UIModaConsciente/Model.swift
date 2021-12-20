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
    
    private var names: [String]
    private var reviews: [String]
    private var stars: [Int]
    private var faces: [String]
    
    init() {
        names = (UserDefaults.standard.array(forKey: namesDefaults) ?? [String]()) as! [String]
        reviews = (UserDefaults.standard.array(forKey: reviewsDefaults)  ?? [String]()) as! [String]
        stars = (UserDefaults.standard.array(forKey: reviewsStarsDefaults) ?? [Int]()) as! [Int]
        faces = (UserDefaults.standard.array(forKey: peopleFacesDefaults) ?? [String]()) as! [String]
    }
    
    func addReview(usrName: String, review: String, stars: Int, usrPhotoName: String) {
        self.names.insert(usrName, at: 0)
        self.reviews.insert(review, at: 0)
        self.stars.insert(stars, at: 0)
        self.faces.insert(usrPhotoName, at: 0)
        
        UserDefaults.standard.setValue(self.names, forKey: namesDefaults)
        UserDefaults.standard.set(self.reviews, forKey: reviewsDefaults)
        UserDefaults.standard.set(self.stars, forKey: reviewsStarsDefaults)
        UserDefaults.standard.set(self.faces, forKey: peopleFacesDefaults)
    }
    
    func getAllReviews() -> ([String], [String], [Int], [String]) {
        return (names, reviews, stars, faces)
    }
    
    func getStarsMean() -> Double {
        return Double(stars.reduce(0, +)) / Double(stars.count)
    }
}

class LastReview {
    private let nameDefaults = "LastName"
    private let reviewDefaults = "LastReview"
    private let reviewStarsDefaults = "LastStars"
    private let faceDefaults = "LastFace"
    
    private var name = ""
    private var review = ""
    private var star = 0
    private var face = ""
    
    init() {
        name = (UserDefaults.standard.string(forKey: nameDefaults) ?? "")
        review = (UserDefaults.standard.string(forKey: reviewDefaults) ?? "")
        star = (UserDefaults.standard.integer(forKey: reviewStarsDefaults))
        face = (UserDefaults.standard.string(forKey: faceDefaults) ?? "")
    }
    
    func getLastReview() -> (String, String, Int, String)?
    {
        if name == "" {
            return nil
        }
        
        return (name, review, star, face)
    }
    
    func setLastReview(name:String, review:String, star:Int, face:String)
    {
        self.name = name
        self.review = review
        self.star = star
        self.face = face
        
        UserDefaults.standard.setValue(self.name, forKey: nameDefaults)
        UserDefaults.standard.set(self.review, forKey: reviewDefaults)
        UserDefaults.standard.set(self.star, forKey: reviewStarsDefaults)
        UserDefaults.standard.set(self.face, forKey: faceDefaults)
    }
    
}

class NextItem {
    private let fraseDefaults = "FraseItem"
    private let imageDefaults = "ImagemItem"
    private let brandDefaults = "MarcaItem"
    private let clothDefaults = "MaterialItem"
    
    private var frase = ""
    private var image = ""
    private var marca = ""
    private var material = ""
    
    init() {
        frase = (UserDefaults.standard.string(forKey: fraseDefaults) ?? "")
        image = (UserDefaults.standard.string(forKey: imageDefaults) ?? "")
        marca = (UserDefaults.standard.string(forKey: brandDefaults) ?? "")
        material = (UserDefaults.standard.string(forKey: clothDefaults) ?? "")
    }
    
    func setNextItem(phrase: String, image: String, brand: Utils.TypeOfBrand, cloth: Utils.TypeOfCloth) {
        self.frase = phrase
        self.image = image
        self.marca = brand.rawValue
        self.material = cloth.rawValue
        
        UserDefaults.standard.setValue(self.frase, forKey: fraseDefaults)
        UserDefaults.standard.set(self.image, forKey: imageDefaults)
        UserDefaults.standard.set(self.marca, forKey: brandDefaults)
        UserDefaults.standard.set(self.material, forKey: clothDefaults)
    }
    
    func getNextItem() -> (phrase: String, image: String, brand: Utils.TypeOfBrand, cloth: Utils.TypeOfCloth)? {
        if marca == "" {
            return nil
        }
        
        let brand = Utils.TypeOfBrand(rawValue: marca)!
        let mater = Utils.TypeOfCloth(rawValue: material)!
        
        return (frase, image, brand, mater)
    }
}
