//
//  DataManager.swift
//  ApiTest
//
//  Created by Thiago de Jesus on 28/06/25.
//

import Foundation
import CoreData

class DataManager{
    
    static let shared = DataManager()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error")
            }
        }
    }
    
}
