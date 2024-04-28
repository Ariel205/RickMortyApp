//
//  CharacterCell.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

struct CharacterCell: View {

    // MARK: Properties

    var item: CharacterViewModel

    // MARK: View

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                if let url = item.imageURL {
                    ImageLoadingView(imageLoader: ImageLoaderViewModel(url: url))
                }
            }
            .padding(.bottom, 10)

            Text(item.name)
                .font(.system(size: 17, weight: .semibold, design: .monospaced))

            HStack {
                Circle()
                    .fill(item.status.color)
                    .frame(width: 11)
                Text("Status: \(item.status.rawValue)")
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
            }
        }
    }
}

#Preview {
    CharacterCell(item: .init(character: .preview))
}
