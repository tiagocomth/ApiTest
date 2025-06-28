//
//  HomeViewModel.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var showAddPhotoView = false
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let spacing: CGFloat = 5
    let padding: CGFloat = 10
    
    var photos: [Photo] = []
    
    var itemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth - (spacing * 2) - (padding * 2)) / 2
    }
    
    var itemHeight: CGFloat {
        return itemWidth
    }
    
}
