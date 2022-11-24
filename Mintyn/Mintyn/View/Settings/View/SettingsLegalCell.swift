//
//  SettingsLegalCell.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

import Foundation

import UIKit
import SnapKit

class SettingsLegalCell: UITableViewCell {
    
    static let identifier = "SettingsLegalCell"
    var checkLabel = ""
    lazy var label: UILabel = {
        var label = UILabel()
        label.textColor = Constants.Colors.textColor
        return label
    }()
    
    let pointerImage: UIButton = {
        var pointerImage = UIButton()
        pointerImage.setImage(UIImage(systemName: "square.and.arrow.up.on.square"), for: .normal)
        pointerImage.tintColor = Constants.Colors.textColor
        return pointerImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(pointerImage)
        contentView.backgroundColor = Constants.Colors.lightBlack
        setConstraints()
        pointerImage.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        pointerImage.isHidden = !selected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        label.snp.makeConstraints({make in
            make.leading.equalTo(contentView).offset(20)
            make.centerY.equalTo(contentView)
        })
        
        pointerImage.snp.makeConstraints({make in
            make.trailing.equalTo(contentView).inset(20)
            make.centerY.equalTo(contentView)
            make.top.bottom.equalTo(contentView)
        })
        
    }
    
    func setUpCell(model: Legal_System_Model, checklabel: String) {
        label.text = model.label
        self.checkLabel = checklabel
    }
    
  
}
