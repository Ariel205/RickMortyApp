//
//  CharacterListViewModel.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

@Observable final class CharacterListViewModel {
    
    // MARK: Properties
    
    private(set) var characterViewModels: [CharacterViewModel] = []
    
    private let characterService: CharacterService
    
    // MARK: - Initialization
    
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    // MARK: Methods
    
    @MainActor
    func start() async {
        do {
            // Fetch Characters
            characterViewModels = try await characterService.getAll()
                .map(CharacterViewModel.init)
        } catch {
            print("Unable to Fetch Data \(error)")
        }
    }
    
}
