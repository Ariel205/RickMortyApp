//
//  ImageLoaderViewModel.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation
import UIKit

@Observable final class ImageLoaderViewModel {

    let url: URL?

    var image: UIImage?
    var errorMessage: String?
    var isLoading: Bool = false

    init(url: URL?) {
        self.url = url
    }

    func fetch() async {

        guard image == nil && isLoading == false else {
            return
        }

        guard let url = url else {
            errorMessage = HttpError.badURL.localizedDescription
            return
        }

        isLoading = true
        errorMessage = nil

        // Cache Policy
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            //print(data)
            if let image = UIImage(data: data) {
                self.image = image
            }
        } catch {
            errorMessage = error.localizedDescription
            print("Unable to Fetch Image \(error)")
        }
    }
}
