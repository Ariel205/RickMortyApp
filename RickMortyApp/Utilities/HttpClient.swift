//
//  HttpClient.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

enum HttpError: Error {
    case badURL
    case badResponse
    case errorDecodingData
}
