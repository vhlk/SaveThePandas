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
        self.names.append(usrName)
        self.reviews.append(review)
        self.stars.append(stars)
        self.faces.append(usrPhotoName)
        
        UserDefaults.standard.setValue(self.names, forKey: namesDefaults)
        UserDefaults.standard.set(self.reviews, forKey: reviewsDefaults)
        UserDefaults.standard.set(self.stars, forKey: reviewsStarsDefaults)
        UserDefaults.standard.set(self.faces, forKey: peopleFacesDefaults)
    }
    
    func getAllReviews() -> ([String], [String], [Int], [String]) {
        return (names, reviews, stars, faces)
    }
}
