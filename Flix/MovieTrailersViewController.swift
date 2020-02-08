//
//  MovieTrailersViewController.swift
//  Flix
//
//  Created by Stephen Baity on 2/6/20.
//  Copyright © 2020 Stephen Baity. All rights reserved.
//

import UIKit
import WebKit

class MovieTrailersViewController: UIViewController, WKUIDelegate {
	
	@IBOutlet weak var webView: WKWebView!
	
	
	var movieID : Any = ""
	var trailerUrl : String = ""
	
    override func loadView() {
       
		let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView

}
		
	override func viewDidLoad() {
        super.viewDidLoad()
		getTrailer()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

	*/
	
	func getTrailer() {
		let getTrailerUrl = URL(string:"https://api.themoviedb.org/3/movie/\(self.movieID)/videos?api_key=5b9c82a33a2f9bbae16be7b023e52afe")!
			let request = URLRequest(url: getTrailerUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
			let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
			let task = session.dataTask(with: request) { (data, response, error) in
			   // This will run when the network request returns
			   if let error = error {
				  print(error.localizedDescription)
			   } else if let data = data {
				  let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				
				let trailer = dataDictionary["results"]  as! [[String: Any]]
				print(trailer)
				let video = trailer[0]
				let key = video["key"] as! String
				print(key)
								
				self.trailerUrl = "https://www.youtube.com/watch?v=\(key)"
				self.webView.reload()
				
				let myURL = URL(string: self.trailerUrl)
				let myRequest = URLRequest(url: myURL!)
				self.webView.load(myRequest)
					
				}
		}
		task.resume()
	}

	
}

