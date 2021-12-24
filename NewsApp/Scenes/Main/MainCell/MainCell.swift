//
//  MainCellTableViewCell.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/24/21.
//

import UIKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"
    static func nib() -> UINib {
        return UINib(nibName: MainCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
