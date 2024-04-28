//
//  RickMortyAppApp.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

@main
struct RickMortyAppApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListView(viewModel: CharacterListViewModel(characterService: CharacterPreviewClient()))
        }
    }
}
