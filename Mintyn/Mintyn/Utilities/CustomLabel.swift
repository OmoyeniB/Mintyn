//
//  CustomLabel.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

import UIKit

public class MyCustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = Constants.Strings.viewcontrollerLabel
        self.textAlignment = .center
        self.numberOfLines = 0
        self.textColor = Constants.Colors.whiteColor
        self.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
}

