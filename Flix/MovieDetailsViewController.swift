//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Stephen Baity on 2/6/20.
//  Copyright © 2020 Stephen Baity. All rights reserved.
//

import UIKit
import AlamofireImage


class MovieDetailsViewController: UIViewController {
	
	var movie : [String:Any]!
	
	@IBOutlet weak var backdropView: UIImageView!
	@IBOutlet weak var posterView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var summaryLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		print("\(backdropView.isUserInteractionEnabled)")
		
		
		titleLabel.text = movie["title"] as? String
		titleLabel.sizeToFit()
		summaryLabel.text = movie["overview"] as? String
		summaryLabel.sizeToFit()
		releaseDateLabel.text = "Release Date: \(movie["release_date"] as! String)"
		summaryLabel.sizeToFit()
		
		let baseUrl = "https://image.tmdb.org/t/p/w780"
		let posterPath = movie["poster_path"] as! String
		let posterUrl = URL(string: baseUrl + posterPath)
		
		posterView.af_setImage(withURL: posterUrl!)
		backdropView.af_setImage(withURL: posterUrl!)
		
	
		
    }
	
	
	@IBAction func onTap(_ sender: UITapGestureRecognizer) {
		print("Hello")
	}
	

	
	
	
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controllerusing segue.destination.
		let trailerViewController = segue.destination as! MovieTrailersViewController
        // Pass the selected object to the new view controller.
		let picture = sender as! UIImageView
		let indexPath = posterView.index(ofAccessibilityElement: picture)
		
		
		
		//Pass selected movie to next screen
		trailerViewController.movie = movie
		
		
		
    }
    

}
