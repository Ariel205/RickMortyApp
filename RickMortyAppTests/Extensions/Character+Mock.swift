//
//  Character+Mock.swift
//  RickMortyAppTests
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation
@testable import RickMortyApp

extension Character {

    static var mock: Character {
        mocksFromJson[0]
    }

    static var mocksFromJson: [Character] {
        let url = Bundle.main.url(forResource: "resources_list", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let container = try! JSONDecoder().decode(ApiDataContainer.self, from: data)
        return container.results
    }

}

