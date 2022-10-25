//
//  Media+CoreDataClass.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation
import CoreData

@objc(Media)
public class Media: NSManagedObject
{
    @NSManaged public var id: Int
    @NSManaged public var title: String
    @NSManaged public var cover: URL
    @NSManaged public var synopsis: String
    @NSManaged public var type: String
}

