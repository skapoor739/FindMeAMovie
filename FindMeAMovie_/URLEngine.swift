//
//  URLEngine.swift
//  FindMeAMovie_
//
//  Created by Shivam Kapur on 05/03/17.
//  Copyright © 2017 ShivamKapoo. All rights reserved.
//

import UIKit

enum URLEngine {
    
    case getURLWithMovieName(Paths, movieName: String)
    
    var mainURL: String {
        return "http://www.omdbapi.com/?"
    }
    
    enum Paths: String {
        case moviePath = "t="
        case tomatoes = "tomatoes="
    }
    
    var URL: String {
        switch self {
        case .getURLWithMovieName(let path, let movieName):
            return "\(mainURL)\(path.rawValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\(movieName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)"
        }
    }
}

