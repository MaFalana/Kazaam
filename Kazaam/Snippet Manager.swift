//
//  Snippet Manager.swift
//  Kazaam
//
//  Created by Malik Falana on 10/10/22.
//

import Foundation
import AVFoundation
import Speech
import SwiftUI


class Snippet_Manager: ObservableObject
{
   // var searchResult: Result
    
    static let shared = Snippet_Manager()
    
    @Published var color = Color.blue
    
    func grabSnippet() //Method that grabs an audio snippet
    {
        //should transcribe audio
        color = Color.red
    }
    
    func storeSnippet()
    {
        
    }
    
    func Snippet_to_String(snippet: URL) -> String //Method that converts Snippet to a String
    {
        // create a new recognizer and point it at our audio
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: snippet)
        var x = ""

        // start recognition!
        recognizer?.recognitionTask(with: request)
        { [unowned self] (result, error) in
            // abort if we didn't get any transcription back
            guard let result = result else
            {
                print("There was an error: \(error!)")
                return
            }

            // if we got the final transcription back, print it
            if result.isFinal
            {
                // pull out the best transcription...
                print(result.bestTranscription.formattedString)
                x = result.bestTranscription.formattedString
               
            }
            
        }
        return x
    }
    
//    func search_IDMb() -> Result //Method that searches IMDb with string
//    {
//        let searchParameter = Snippet_to_String(snippet: <#T##URL#>)
//    }
    
    func is_Result() -> Bool //Method to check if search result is not a null value
    {
        return false
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
