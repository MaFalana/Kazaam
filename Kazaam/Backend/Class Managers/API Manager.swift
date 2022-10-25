//
//  API Manager.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation
import SwiftUI

class API_Manager: ObservableObject
{
    static let shared = API_Manager()
    
    @StateObject var CM = CoreData_Manager.shared
    
    let key = "baedc85bd56f8eedf180842d59510698" // API Key
    var query = "Train"
    let id_Array = ["imdb_id","freebase_id","tvbd_id","tvrage_id"]
    let mediaType = "movie"
    var newArray: [Result] = []
    
    func createUrl(id: String = "") -> URL //Method to create URL
    {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        
        if id == ""
        {
            components.path = "/3/search/keyword"
            components.queryItems =
            [
                URLQueryItem(name: "api_key", value: key),
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: "1")
            ]
        }
        else
        {
            components.path = "/3/find/\(id)"
            components.queryItems =
            [
                URLQueryItem(name: "api_key", value: key),
                URLQueryItem(name: "external_source", value: id_Array[0])
            ]
        }
        
        return components.url!
    }
    
    func searchTMDB() async
    {
        let url = createUrl()
        print(url)
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode data
            let decodedResponse = try? JSONDecoder().decode(Keyword_Response.self, from: data)
            
            if let decodedResponse = decodedResponse
            {
                //TOTAL = decodedResponse.total
                print("Before: \(decodedResponse)")
                DispatchQueue.main.async
                { [self] in
                    //print("Before: \(decodedResponse.data)")
                    Task
                    {
                        await getExternalID(id: "\(decodedResponse.results[0]!.id!)")
                        //Trans(Data: decodedResponse.data, Storage: collectionData, Max: decodedResponse.data.count)
                        //collectionData.append(contentsOf: Temp)
                        //Temp.removeAll()
                    }
                }
            }
            //print("Data: \(decodedResponse?.data)")
            
        }
        catch let error
        {
            print("ERROR = \(error.localizedDescription)")
        }
        
    }
    
    func searchByID(id: String) async
    {
        let url = createUrl(id: id)
        print(url)
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode data
            let decodedResponse = try? JSONDecoder().decode(Find_Response.self, from: data)
            
            if let decodedResponse = decodedResponse
            {
                Task
                {
                    let b = decodedResponse.movie_results[0]
                    print(decodedResponse.movie_results[0]!)
                    createResult(Item: b!)                }
                
            }
            //print("Data: \(decodedResponse?.data)")
            
        }
        catch let error
        {
            print("There was an error querying TMDB with id \(id):  \(error.localizedDescription)")
        }
    }
    
    func getExternalID(id: String = "")async
    {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/external_ids?api_key=\(key)")!
        
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode data
            let decodedResponse = try? JSONDecoder().decode(External_Response.self, from: data)
            
            if let decodedResponse = decodedResponse
            {
                //TOTAL = decodedResponse.total
                print("Before: \(decodedResponse)")
                DispatchQueue.main.async
                { [self] in
                    //print("Before: \(decodedResponse.data)")
                    Task
                    {
                        await searchByID(id: "\(decodedResponse.imdb_id!)")
                        //Trans(Data: decodedResponse.data, Storage: collectionData, Max: decodedResponse.data.count)
                        //collectionData.append(contentsOf: Temp)
                        //Temp.removeAll()
                    }
                }
            }
            //print("Data: \(decodedResponse?.data)")
            
        }
        catch let error
        {
            print("ERROR = \(error.localizedDescription)")
        }
    }
    
    func createResult(Item: Find_Response.movie)
    {
        let id = Item.id!
        let title = Item.title!
        let cover = URL(string: "https://image.tmdb.org/t/p/w500\(Item.poster_path ?? "")")!
        let synopsis = Item.overview!
        let type = Item.media_type!
        
        //print("Title: \(Item.id!)")
        let R = Result(id: id, title: title, cover: cover, synopsis: synopsis, type: type)
        //print("Cover: \(cover)")
        print(R)
        newArray.append(R)
        //CM.Create(Item: R)
    }
}

