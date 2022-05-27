//
//  ArticleModel.swift
//  News App
//
//  Created by Chris Boshoff on 2022/02/25.
//

import Foundation

protocol ArticelMethodProtocol {
    
    func articlesRetrieved(_ articles:[Article])
}


class ArticleModel {
    
    var delegate: ArticelMethodProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a3e3c20da12e4dd981e6c42d66e6ec16"
        
        // Create URL object
        let url = URL(string: urlString)
        
        // Check that it isn't nil
        guard url != nil else {
            
            print("Couldn't find url string")
            return
        }
        
        
        // Create URL session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check that there are no errors
            if error == nil && data != nil {
                
                // Attempt to parse JSON
                let decoder = JSONDecoder()
                
                do {
                    // Parse JSON into Article Service
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get Articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        
                        // Parse the returned JSON into article instance and pass it back to the view controller with the protocol and delegate pattern
                        self.delegate?.articlesRetrieved(articles)
                    }
                    
                } catch {
                    print("Error parsing the json")
                }
            }
       
        }
        
        // Start the data task
        dataTask.resume()
       
    }
}
