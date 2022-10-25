//
//  Media.swift
//  Kazaam
//
//  Created by Malik Falana on 10/24/22.
//

import Foundation

struct Result: Codable, Identifiable
{
    let id: Int
    let title: String
    let cover: URL
    let synopsis: String
    let type: String
}


struct Keyword_Response: Codable
{
    let page: Int?
    let results: [result?]
    let total_pages: Int?
    let total_results: Int?
    
    struct result: Codable
    {
        let id: Int?
        let name: String?
    }
}

struct Find_Response: Codable
{
    let movie_results: [movie?]
    let person_results: [person?]
    let tv_results: [tv]?
    let tv_episode_results: [episode]?
    let tv_season_results: [season]?
    
    struct movie: Codable
    {
        let poster_path: String?
        let adult: Bool?
        let overview: String?
        let release_date: String?
        let genre_ids: [Int]?
        let id: Int?
        let media_type: String?
        let original_title: String?
        let original_language: String?
        let title: String?
        let backdrop_path: String?
        let popularity: Double? //Number
        let vote_count: Int?
        let video: Bool?
        let vote_average: Double? //Number
    }
    
    struct person: Codable
    {
        let profile_path: String?
        let adult: Bool?
        let id: Int?
        let known_for: oneOf?
        let name: String?
        let popularity: Int?
        
        struct oneOf: Codable
        {
            let object: movie?
            let object2: tv?
        }
    }
    
    struct tv: Codable
    {
        let poster_path: String?
        let popularity: Int?
        let id: Int?
        let overview: String?
        let backdrop_path: String?
        let vote_average: Int? //Number
        let media_type: String?
        let first_air_date: String?
        let origin_country: [String]?
        let genre_ids: [Int]?
        let original_language: String?
        let vote_count: Int?
        let name: String?
        let original_name: String?
    }
    
    struct episode: Codable
    {
        
    }
    
    struct season: Codable
    {
        
    }
}


struct External_Response: Codable
{
    let imdb_id: String?
    //let freebase_mid: String?
    //let freebase_id: String?
    let tvdb_id: Int?
    //let tvrage_id: Int?
    let facebook_id: String?
    let instagram_id: String?
    let twitter_id: String?
    let id: Int?
}

