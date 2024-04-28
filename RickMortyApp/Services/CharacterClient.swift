//
//  CharacterClient.swift
//  RickMortyApp
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import Foundation

struct CharacterClient: CharacterService {

    let apiUrl: URL

    // MARK: - Initialization

    init(apiUrl: URL = Constants.apiUrl) {
        self.apiUrl = apiUrl
    }

    // MARK: - Methods

    func getAll() async throws -> [Character] {

        let (data, response) = try await URLSession.shared.data(from: apiUrl)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }

        do {
            let container = try JSONDecoder().decode(ApiDataContainer.self, from: data)
            return container.results
        } catch {
            throw HttpError.errorDecodingData
        }
    }

}
