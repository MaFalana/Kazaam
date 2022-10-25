//
//  Core Data Manager.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation
import CoreData

class CoreData_Manager: ObservableObject
{
    static let shared = CoreData_Manager()
    
    @Published var history: [Media] = []
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext
    {
        return persistentContainer.viewContext
    }
    
    init()
    {
        persistentContainer = NSPersistentContainer(name: "Kazaam")
        load()
        Save()
    }
    
}
// MARK:- Media related Functions
extension CoreData_Manager
{
    func Create(Item: Result)
    {
        let newMedia = Media(context: viewContext)
        newMedia.id = Item.id
        newMedia.title = Item.title
        newMedia.cover = Item.cover
        newMedia.synopsis = Item.synopsis
        newMedia.type = Item.type
        history.append(newMedia)
        Save()
    }
    
    func fetchHistory() //Function that fetches saved history
    {
        do
        {
            history = try viewContext.fetch(Media.fetchRequest())
        }
        catch
        {
            print("Error fetching history. \(error.localizedDescription)")
        }
    }
}

// MARK:- Basic Functions
extension CoreData_Manager
{
    
    func Save()
    {
        do
        {
            if viewContext.hasChanges
            {
                DispatchQueue.main.async
                { [self] in
                    Task
                    {
                        try viewContext.save()
                        print("Changes successfully saved")
                        fetchHistory()
                    }
                }
            }
            else
            {
                try viewContext.save()
                print("Successfully saved")
            }
        }
        catch
        {
            print("Error occured while saving: \(error.localizedDescription)")
            print("Unsuccessful Save")
        }
        
    }
    
    func load()
    {
        persistentContainer.loadPersistentStores
        {
            (description, error) in
            if let error = error
            {
                print("Error loading Core Data: \(error.localizedDescription)")
            }
            else
            {
                print("Loading successful")
            }
        }
        fetchHistory()
    }
}

