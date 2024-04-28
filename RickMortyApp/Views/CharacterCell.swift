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
                
                AsyncImage(url: item.imageURL) { image in
                    image
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 170)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
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
