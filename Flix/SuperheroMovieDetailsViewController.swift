//
//  SuperheroMovieDetailsViewController.swift
//  Flix
//
//  Created by Stephen Baity on 2/6/20.
//  Copyright © 2020 Stephen Baity. All rights reserved.
//

import UIKit
import AlamofireImage

class SuperheroMovieDetailsViewController: UIViewController {

	var movie : [String:Any]!
	
	@IBOutlet weak var backdropView: UIImageView!
	@IBOutlet weak var posterView: UIImageView!
	@IBOutlet weak var titleView: UILabel!
	@IBOutlet weak var releaseDate: UILabel!
	@IBOutlet weak var summaryView: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
			titleView.text = movie["title"] as? String
			titleView.sizeToFit()
			summaryView.text = movie["overview"] as? String
			summaryView.sizeToFit()
			releaseDate.text = "Release Date: \(movie["release_date"] as! String)"
			summaryView.sizeToFit()
			
			let baseUrl = "https://image.tmdb.org/t/p/w780"
			let posterPath = movie["poster_path"] as! String
			let posterUrl = URL(string: baseUrl + posterPath)
			
			posterView.af_setImage(withURL: posterUrl!)
			posterView.isUserInteractionEnabled = true
			backdropView.af_setImage(withURL: posterUrl!)
			
		}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		  // Get the new view controller using segue.destination.
		  // Pass the selected object to the new view controller.
		  let trailerViewController = segue.destination as! MovieTrailersViewController
		  // Pass the selected object to the new view controller.

		  //Pass selected movie to next screen
		  
		  trailerViewController.movieID = movie["id"] as! Int
	  }
		
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
   


