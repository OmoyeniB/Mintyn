//
//  SettingsTableViewCell.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    lazy var stackView: UIStackView = {
       var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = Constants.Colors.lightBlack
        return stackView
    }()
    
    lazy var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "square.and.arrow.up")
        image.tintColor = Constants.Colors.textColor
        return image
    }()
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.textColor = Constants.Colors.textColor
        return label
    }()
    
    let pointerImage: UIButton = {
        var pointerImage = UIButton()
        pointerImage.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        pointerImage.tintColor = Constants.Colors.textColor
        return pointerImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
        stackView.addSubview(image)
        stackView.addSubview(label)
        stackView.addSubview(pointerImage)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        image.snp.makeConstraints { make in
            make.leading.equalTo(stackView).offset(20)
            make.centerY.equalTo(stackView)
            make.height.width.equalTo(40)
        }
        
        label.snp.makeConstraints({make in
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.centerY.equalTo(image)
        })
        
        pointerImage.snp.makeConstraints({make in
            make.trailing.equalTo(stackView).inset(20)
            make.top.bottom.equalTo(stackView)
        })
        
    }
    
    func setUpCell(model: SettingsModel) {
        image.image = UIImage(systemName: model.image)
        label.text = model.label
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
