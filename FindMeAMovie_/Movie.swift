//
//  Movie.swift
//  FindMeAMovie_
//
//  Created by Shivam Kapur on 05/03/17.
//  Copyright © 2017 ShivamKapoor. All rights reserved.
//

import Foundation

enum JSONError: String, Error {
    case noData = "ERROR: No DATA"
    case conversionFailed = "Conversion failed."
}


class Movie {
    
    private var _movieName: String
    private var _genre: String
    private var _releaseDate: String
    private var _plotInfo: String
    private var _rating: String
    private var _imageURL: String
    
    var movieName: String {
        return _movieName
    }
    
    var genre: String {
        return _genre
    }
    
    var releaseDate: String {
        return _releaseDate
    }
    
    var plotInfo: String {
        return _plotInfo
    }
    
    var rating: String {
        return _rating
    }
    
    var imageURL: String {
        return _imageURL
    }
    
    init(movieName: String, genre: String, releaseDate: String, plotInfo: String, rating: String, imageURL: String) {
        self._movieName = movieName
        self._genre = genre
        self._releaseDate = releaseDate
        self._plotInfo = plotInfo
        self._rating = rating
        self._imageURL = imageURL
    }
    
    class func getMovieObject(name: String, completionHandler: @escaping (Movie?) -> ()) {
        let stringURL = URLEngine.getURLWithMovieName(.moviePath, movieName: name).URL
        let nsURL = URL(string: stringURL)
        
        URLSession.shared.dataTask(with: nsURL!) { (data, response, error) in
            do {
                guard let data = data else {
                    completionHandler(nil)
                    throw JSONError.noData
                }
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, AnyObject> else {
                    completionHandler(nil)
                    throw JSONError.conversionFailed
                }
                //                Title, Genre, Release date, Plot (short version) and rating.
                
                

                if let valid = json["Response"] as? String {
                    if valid == "True" {

                        if let title = json["Title"] as? String, let genre = json["Genre"] as? String, let releaseDate = json["Released"] as? String, let plot = json["Plot"] as? String, let rating = json["imdbRating"] as? String, let poster = json["Poster"] as? String {
                            
                            let movie = Movie(movieName: title, genre: genre, releaseDate: releaseDate, plotInfo: plot, rating: rating, imageURL: poster)
                            completionHandler(movie)
                            
                        }
                        
                    }   else if valid == "False" {
                        completionHandler(nil)
                    }
                }
                
                
            }   catch let error as JSONError {
                print(error.rawValue)
            }   catch let error {
                print(error.localizedDescription)
            }
            
            }.resume()
    }
}
