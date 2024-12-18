//
//  CharacterPreviewClient.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

struct CharacterPreviewClient: CharacterService {
    
    // MARK: Methods
    
    func characters() async throws -> [Character] {
        return Character.previews
    }
    
}
