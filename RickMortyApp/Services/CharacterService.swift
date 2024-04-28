//
//  CharacterService.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

protocol CharacterService {

    // MARK: Methods
    func getAll() async throws -> [Character]

}
