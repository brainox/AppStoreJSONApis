//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by Decagon on 28/12/2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let topFreeUrl = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
      
        fetchAppGroup( urlString: topFreeUrl, completion: completion )
    }
    
    func fetchTopPaidApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let topPaidURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
      
        fetchAppGroup( urlString: topPaidURL, completion: completion )
    }
    
    func fetchAppGroup ( urlString: String, completion: @escaping (AppGroup?, Error?) -> Void ) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping([SocialApp]?, Error?) -> Void ) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> Void ) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            
            if error != nil {
                completion(nil, error)
              return
            }
            
            guard let data = data else { return }
            
            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
