//
//  CharacterCellViewModel.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

struct CharacterViewModel: Identifiable {

    enum Status: String {
        case alive = "Alive"
        case dead = "Dead"
        case unknow = "Unknow"

        var color: Color {

            switch self {
            case .alive:
                return .green
            case .dead:
                return .red
            default:
                return .gray
            }
        }
    }

    // MARK: Properties

    private let character: Character

    // MARK: - Initialization

    init(character: Character) {
        self.character = character
    }

    // MARK: Public API

    var id: Int {
        character.id
    }

    var name: String {
        character.name
    }

    var status: Status {

        switch character.status {
        case "Alive":
             Status.alive
        case "Dead":
             Status.dead
        default:
             Status.unknow
        }
    }

    var specie: String {
        character.specie
    }

    var type: String {
        character.type != "" ? character.type : "-"
    }

    var gender: String {
        character.gender
    }

    var imageURL: URL? {
        URL(string: character.imageURL)
    }

    var origin: String {
        character.origin
    }

    var location: String {
        character.location
    }

}
