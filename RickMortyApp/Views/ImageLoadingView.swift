//
//  ImageLoadingView.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import SwiftUI

struct ImageLoadingView: View {
    
    // MARK: Properties
    @State var imageLoader: ImageLoaderViewModel
    
    // MARK: - Initialization
    
    init(imageLoader: ImageLoaderViewModel) {
        self.imageLoader = imageLoader
    }
    
    // MARK: View
    
    var body: some View {
        
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    
            } else if let error = imageLoader.errorMessage {
                Text(error)
                    .foregroundStyle(Color.red)
                    .frame(width: 120, height: 120)
            } else {
                ProgressView()
            }
        }
        .task {
            await imageLoader.loadImage()
        }
    }
}

#Preview {
    ImageLoadingView(imageLoader: ImageLoaderViewModel( url: URL(string: Character.preview.imageURL)!))
}
