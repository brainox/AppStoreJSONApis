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
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("failed to fetch app: ", error)
                
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult, nil)
            } catch let jsonErr {
                completion(nil,jsonErr)
            }
        }.resume()
    }
    
    func fetchAllApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        
        let topPaidURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        let topFreeUrl = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        
        guard let url = URL(string: topPaidURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error  in
            
            if error != nil {
                completion(nil, error)
              return
            }
            
            guard let data = data else { return }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data)
                
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
}
