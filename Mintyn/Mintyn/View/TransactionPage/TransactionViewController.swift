//
//  TransactionViewController.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class TransactionViewController: UIViewController {

    let text = MyCustomLabel()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = Constants.Colors.blackColor
         view.addSubview(text)
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         text.frame = view.bounds
     }
     

}
