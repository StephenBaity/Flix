//
//  MovieCell.swift
//  Flix
//
//  Created by Stephen Baity on 1/31/20.
//  Copyright © 2020 Stephen Baity. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {


	@IBOutlet weak var posterView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var summaryLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
