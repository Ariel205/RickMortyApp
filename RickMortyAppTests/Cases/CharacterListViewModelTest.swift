//
//  RickMortyAppTests.swift
//  RickMortyAppTests
//
//  Created by Ariel Antonio Fundora López on 28/4/24.
//

import XCTest
@testable import RickMortyApp

final class CharacterListViewModelTest: XCTestCase {

    var sut: CharacterListViewModel!

    override func setUp() {
        sut = CharacterListViewModel(characterService: MockCharacterClient())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchCharactersSuccess() async throws {
        //When
        await sut.start()
        //Then
        XCTAssertTrue(sut.characterViewModels.count > 0)
    }

}
