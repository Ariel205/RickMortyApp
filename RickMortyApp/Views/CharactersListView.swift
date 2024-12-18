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

    @State private var searchText = ""

    // MARK: View

    var body: some View {

        NavigationStack {
            List(viewModel.characterViewModels.filter({
                searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
            })) { item in
                ZStack(alignment: .leading) {
                    NavigationLink(destination: CharacterDetailView(character: item)) {
                        EmptyView()
                    }
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
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")
        .task {
            URLCache.shared.memoryCapacity = 100_000_000 // ~100 MB memory space
            URLCache.shared.diskCapacity = 1_000_000_000 // ~1GB disk cache space
        }
    }
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel(characterService: CharacterPreviewClient()))
}
