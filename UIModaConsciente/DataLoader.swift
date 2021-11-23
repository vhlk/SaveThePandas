//
//  DataLoader.swift
//  UIModaConsciente
//
//  Created by Luana Porciuncula Barreto on 23/11/21.
//

import Foundation

public class DataLoader {
    @Published var recentClothe = [RecentClothe]();
    @Published var newsArticle = [NewsArticle]();
    
    
    init (){
        loadRecentData()
        loadNewsData()
    }
    
    func loadRecentData() {
        if let fileLocation = Bundle.main.url(forResource: "recentData", withExtension: "json") {
            do {
                let recentData = try Data(contentsOf:fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([RecentClothe].self, from: recentData)
                self.recentClothe = dataFromJson
            } catch {
                print(error)
            }
        }
    }
        
    func loadNewsData() {
        if let fileLocation = Bundle.main.url(forResource: "newsData", withExtension: "json") {
            do {
                let newsData = try Data(contentsOf:fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([NewsArticle].self, from: newsData)
                self.newsArticle = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
}
