//
//  Character.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

// Character Api Data Wrapper
struct ApiDataContainer: Codable {
    let results: [Character]
}

struct Character {

    // MARK: Properties

    let id: Int
    let name: String
    let status: String
    let specie: String
    let type: String
    let gender: String
    let imageURL: String
    let origin: String
    let location: String

}

extension Character: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case specie = "species"
        case type
        case gender
        case imageURL = "image"
        case origin
        case location
    }

    private enum OriginCodingKeys: String, CodingKey {
        case name
        case url
    }

    private enum LocationCodingKeys: String, CodingKey {
        case name
        case url
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)

        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(String.self, forKey: .status)
        self.specie = try container.decode(String.self, forKey: .specie)
        self.type = try container.decode(String.self, forKey: .type)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)

        // Decode nested values

        let originContainer = try container.nestedContainer(keyedBy: OriginCodingKeys.self, forKey: .origin)
        self.origin = try originContainer.decode(String.self, forKey: .name)

        let locationContainer = try container.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
        self.location = try locationContainer.decode(String.self, forKey: .name)

    }

}

 #if DEBUG
extension Character {

    static var preview: Character {
        previews[0]
    }

        static var previews: [Character] {
            [
                .init(id: 1, name: "Rick Sanchez", status: "Alive", specie: "Human", type: "", gender: "Male", imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: "Earth (C-137)", location: "Citadel of Ricks"),
                .init(id: 2, name: "Morty Smith", status: "Dead", specie: "Human", type: "", gender: "Male", imageURL: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", origin: "Earth (C-137)", location: "Citadel of Ricks"),
                .init(id: 3, name: "Ticktock", status: "unknown", specie: "Humanoid", type: "Clay-Person", gender: "Genderless", imageURL: "https://rickandmortyapi.com/api/character/avatar/664.jpeg", origin: "Earth (C-137)", location: "Citadel of Ricks")
            ]
        }

}
 #endif
