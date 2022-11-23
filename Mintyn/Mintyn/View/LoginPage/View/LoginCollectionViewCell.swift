//
//  LoginCollectionViewCell.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {

    static let identifier = "LoginCollectionViewCell"
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupcell(with model: LoginDisplayModel) {
        mainLabel.text = model.label
        image.image = UIImage(named: model.image)
        status.text = model.labelStatus
    }
}
