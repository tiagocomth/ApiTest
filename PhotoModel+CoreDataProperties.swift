//
//  PhotoModel+CoreDataProperties.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//
//

import Foundation
import CoreData


extension PhotoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoModel> {
        return NSFetchRequest<PhotoModel>(entityName: "PhotoModel")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?

}

extension PhotoModel : Identifiable {

}

extension PhotoModel {
    
    var wrappedName: String {
        return name ?? ""
    }
    var wrappedImage: String {
        return image ?? ""
    }
}
