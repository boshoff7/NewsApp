//
//  ViewController.swift
//  News App
//
//  Created by Chris Boshoff on 2022/02/25.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller as the datasource and deleagte as the table view
        tableView.delegate = self
        tableView.dataSource = self

        // Get the article from the article model
        model.delegate = self
        model.getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Detect which the indexpath the user selected
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            // the user hasn't selected anything
            return
        }
        
        // Get the article the user tapped on
        let article = articles[indexPath!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Pass the article url to the detail view controller
        detailVC.articleUrl = article.url!
        
        
        
    }

}

// MARK: - UITableView Delegate and DataSource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count  
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article that the table view is asking about
        let article = articles[indexPath.row]
        
        // Customisze it
        cell.displayArticle(article)
        
        // Return the cell
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

}

// MARK: - Article Model Method Protocol/Delegate

extension ViewController: ArticelMethodProtocol {
    
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the article property of the view controller to the articles passed back from the model
        self.articles = articles
        
        // Refresh the tableview
        tableView.reloadData()
        
    }
    
    
    
}
