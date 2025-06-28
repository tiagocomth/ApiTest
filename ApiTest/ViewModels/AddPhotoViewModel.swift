//
//  AddPhotoViewModel.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation
import SwiftUI
import CoreData

@Observable
class AddPhotoViewModel {
    
    
    var name: String = ""
    var image: PhotoResponse?
    var urlImageString: String?
    
    private var apiClient = APIClient()

    
    
    func getImage() async{
        
        let result = await apiClient.fetchImage(name: name)
        
        switch result {
            case .success(let data):
                self.image = data
                if let imageString = image?.results.first?.urls.regular{
                urlImageString = imageString
            }
            case .failure(let error):
                print("error: \(error)")
        }
        
        
        
    }
    
    func addPhoto(context: NSManagedObjectContext) {
        let newPhoto = PhotoModel(context: context)
        newPhoto.name = name
        newPhoto.image = urlImageString ?? ""
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    
}

