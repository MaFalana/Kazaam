//
//  Snippet Manager.swift
//  Kazaam
//
//  Created by Malik Falana on 10/10/22.
//

import Foundation


class Snippet_Manager: ObservableObject
{
    var searchResult: Result
    
    func grabSnippet()
    {
        
    }
    
    func storeSnippet()
    {
        
    }
    
    func Snippet_to_String() -> String //Method that converts Snippet to a String
    {
        
    }
    
    func search_IDMb() -> Result //Method that searches IMDb with string
    {
        
    }
    
    func is_Result() -> Bool //Method to check if search result is not a null value
    {
        
    }
    
    func showResults()
    {
        
    }
    
    func openPlatform()
    {
        
    }
}


struct Result: Codable
{
    let Title: String
    let Cover: String
    let Synopsis: String
    let Genre: String
}
