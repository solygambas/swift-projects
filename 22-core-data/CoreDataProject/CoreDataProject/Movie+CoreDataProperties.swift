//
//
// Movie+CoreDataProperties.swift
// CoreDataProject
//
// Created by Solygambas on 19/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
