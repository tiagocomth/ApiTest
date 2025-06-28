//
//  HomeViewModel.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation
import SwiftUI
import CoreData

@Observable
class HomeViewModel {
    var showAddPhotoView = false
    var editPhoto: PhotoModel?
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    let spacing: CGFloat = 5
    let padding: CGFloat = 10
    
    //var photos: [Photo] = []
    
    var itemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth - (spacing * 2) - (padding * 2)) / 2
    }
    
    var itemHeight: CGFloat {
        return itemWidth
    }
    
    func delete(context: NSManagedObjectContext, photo: PhotoModel){
        
        context.delete(photo)
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
}
