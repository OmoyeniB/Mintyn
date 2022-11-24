//
//  MorePageViewController.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 23/11/2022.
//

import UIKit

class MorePageViewController: UIViewController {

    let text = MyCustomLabel()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         title = Constants.Strings.more
         view.backgroundColor = Constants.Colors.blackColor
         view.addSubview(text)
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         text.frame = view.bounds
     }
     


}
