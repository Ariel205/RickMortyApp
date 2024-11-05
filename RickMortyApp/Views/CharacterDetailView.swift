//
//  CharacterDetailView.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

struct CharacterDetailView: View {

    // MARK: Properties

    var character: CharacterViewModel

    // MARK: View

    var body: some View {

        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if let url =  character.imageURL {
                    ImageLoadingView(imageLoader: ImageLoaderViewModel(url: url))
                        .scaledToFit()
                }
            }
            .overlay {
                VStack(alignment: .leading, spacing: 5) {
                    Text(character.name)
                        .font(.system(size: 28, weight: .black, design: .rounded))
                        .foregroundColor(.black)
                    Text("Specie: \(character.specie)")
                        .font(.system(.headline, design: .rounded))
                        .padding(.all, 7)
                        .bold()
                        .background(Color.black)
                        .cornerRadius(2)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                .foregroundColor(.white)
                .padding()
            }

            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Status: \(character.status.rawValue)")
                        Circle()
                            .fill(character.status.color)
                            .frame(width: 11)
                    }
                    Text("Gender: \(character.gender)")
                    Text("Type: \(character.type)")

                }
                .font(.system(size: 20, weight: .semibold, design: .rounded))

                DescriptionCell(title: "First seen in:", subtitle: character.origin)
                DescriptionCell(title: "Last known location:", subtitle: character.location)

            }
            .padding()
            Spacer()

        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
        .foregroundColor(.white)
        .background(Color.black.opacity(0.8))
        .ignoresSafeArea()

    }
}

#Preview {
    CharacterDetailView(character: .init(character: .preview))
}

struct DescriptionCell: View {

    // MARK: Properties

    let title: String
    let subtitle: String

    // MARK: View

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(.title3, design: .rounded))
                .foregroundColor(Color.mint)
            Text(subtitle)
                .padding(.top, 6)
        }
        .font(.system(size: 24, weight: .semibold, design: .rounded))
    }
}
