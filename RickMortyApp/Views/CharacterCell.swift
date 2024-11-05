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

        HStack(alignment: .top, spacing: 15) {
            if let url = item.imageURL {
                ImageLoadingView(imageLoader: ImageLoaderViewModel(url: url))
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.system(size: 17, weight: .semibold, design: .monospaced))
                    .padding(.top, 15)
                HStack {
                    Circle()
                        .fill(item.status.color)
                        .frame(width: 11)
                    Text("Status: \(item.status.rawValue)")
                        .font(.system(size: 15, weight: .regular, design: .monospaced))
                }
            }
            Spacer()
        }
        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
        .cornerRadius(10)
    }
}

#Preview {
    CharacterCell(item: .init(character: .preview))
}
