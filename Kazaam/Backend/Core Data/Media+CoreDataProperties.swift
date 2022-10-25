//
//  Media+CoreDataProperties.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation
import CoreData

extension Media
{
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Media>
    {
        return NSFetchRequest<Media>(entityName: "Media")
    }
    
}

extension Media : Identifiable
{
    
}
