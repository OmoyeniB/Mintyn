//
//  HomePageViewModel.swift
//  Mintyn
//
//  Created by Sharon Omoyeni Babatunde on 24/11/2022.
//

protocol HomePageViewModelProtocol {
    func createImageModel() -> [HomePageProductModel]
}

import Foundation

final class HomePageViewModel: HomePageViewModelProtocol {
    
    func createImageModel() -> [HomePageProductModel] {
        return [ HomePageProductModel(image: "productUpdates"),
                 HomePageProductModel(image: "giftCards"),
                 HomePageProductModel(image: "cardless")
        ]
    }
    
    
}
