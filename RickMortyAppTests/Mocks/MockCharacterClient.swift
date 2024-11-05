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

    func characters() async throws -> [Character] {
        return Character.mocksFromJson
    }

}
