//
//  Snippet Manager.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation
import SwiftUI
import AVFoundation

class SnippetManager: ObservableObject
{
    static let shared = SnippetManager() // Shared instance of class to use throughout app
    
    @StateObject var MM = MicrophoneManager.shared
    
    @StateObject var CM = CoreData_Manager.shared
    
    @StateObject var AM = API_Manager.shared
    
    @Published var color: Color = Color(.systemGreen)
    
    enum SnippetError: Error
    {
        case conversionError
    }
    
    //@Published var IMBd_Result: Result
    
    func grabSnippet()
    {
        color = Color(.systemRed)
        Task
        {
            await AM.searchTMDB()
        }
        
        
    }
    
    func storeSnippet()
    {
        
    }
    
    func convertSnippet() -> String
    {
        do
        {
            throw SnippetError.conversionError
        }
        catch
        {
            print("An error occurred while converting the snippet")
        }
        
        return ""
    }
}

