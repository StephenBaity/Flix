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
	
	var movie : [String:Any]!
	
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let myURL = URL(string:"https://api.themoviedb.org/3/movie/\(movie["id"])/videos?api_key=5b9c82a33a2f9bbae16be7b023e52afe")
		let myRequest = URLRequest(url: myURL!)
		webView.load(myRequest)

        // Do any additional setup after loading the view.
		
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
