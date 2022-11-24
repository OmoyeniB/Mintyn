//
//  HomePageCollectionViewCell.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomePageCollectionViewCell"
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func setUpCell(with model: HomePageProductModel) {
        productImage.image = UIImage(named: model.image)
    }
}
