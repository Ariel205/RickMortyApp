//
//  ContentView.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

struct CharacterListView: View {

    // MARK: Properties

    @State var viewModel: CharacterListViewModel

    // MARK: View

    var body: some View {

        NavigationStack {
            List(viewModel.characterViewModels) { item in
                ZStack(alignment: .leading) {
                    //                    NavigationLink(destination: CharacterDetailView(character: item)) {
                    EmptyView()
                    //                    }
                        .opacity(0)
                    CharacterCell(item: item)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("The Rick & Morty App")
            .task {
                await viewModel.start()
            }
        }
    }
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel(characterService: CharacterPreviewClient()))
}
