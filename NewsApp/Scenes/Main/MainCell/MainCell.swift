//
//  MainCellTableViewCell.swift
//  NewsApp
//
//  Created by Mohammadreza Rahmani on 12/24/21.
//

import UIKit
import RxSwift
import SDWebImage

class MainCell: UITableViewCell {

    static let identifier = "MainCell"
    static func nib() -> UINib {
        return UINib(nibName: MainCell.identifier, bundle: nil)
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet var logo: UIImageView!
    @IBOutlet var title: UILabel!
    
    // MARK: - Properties
    
    private var disposeBag: DisposeBag? = DisposeBag()
    
    var viewModel: MainCellModeling? {
        didSet {
            let disposeBag = DisposeBag()
            
            guard let viewModel = viewModel else { return }
            
            title.text = viewModel.title
            
            if let url = viewModel.imageUrl {
                logo.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "News"),options: .refreshCached)
            }
            
            self.disposeBag = disposeBag
        }
    }
    
    

    // MARK: - Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = nil
        viewModel = nil
    }
    
}
