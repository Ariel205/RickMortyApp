//
//  ImageLoaderViewModel.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation
import UIKit

@Observable final class ImageLoaderViewModel {

    enum Error: Swift.Error {
        case imageCastingFailed
    }

    // MARK: Properties

    let url: URL

    var image: UIImage?
    var errorMessage: String?
    var isLoading = false

    // MARK: - Initialization

    init(url: URL) {
        self.url = url
    }

    // MARK: Methods

    @MainActor
    func loadImage() async  {
        
        if image != nil || isLoading  {
            return
        }

        isLoading = true
        defer { self.isLoading = false }

        //Load Image
        do {
            self.image = try await fetch(for: url)
        } catch {
            errorMessage = error.localizedDescription
            print("Unable to Fetch Image \(error)")
        }
    }

    private func fetch(for url: URL) async throws -> UIImage {

        // Cache Policy
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        //
        let (data, _) = try await URLSession.shared.data(for: request)
        //print(data)
        guard let image = UIImage(data: data) else {
            throw Error.imageCastingFailed
        }

        return image
    }

}
