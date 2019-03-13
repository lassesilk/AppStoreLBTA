//
//  Service.swift
//  AppStoreLBTA
//
//  Created by Lasse Silkoset on 06/03/2019.
//  Copyright © 2019 Lasse Silkoset. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service() //Singleton
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
      
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    //Generic json func
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                
                let objects = try JSONDecoder().decode(T.self, from: data!)
                
                completion(objects, nil)
                
            } catch {
                completion(nil, error)
            }
            
            }.resume()
    }
}
