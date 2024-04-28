//
//  MockCharacterClient.swift
//  RickMortyAppTests
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation
@testable import RickMortyApp

struct MockCharacterClient: CharacterService {

    //MARK: Methods

    func getAll() async throws -> [Character] {
        return Character.mocksFromJson
    }

}
