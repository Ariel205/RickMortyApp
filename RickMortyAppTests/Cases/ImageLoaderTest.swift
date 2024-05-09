//
//  ImageLoaderTest.swift
//  RickMortyAppTests
//
//  Created by Ariel Antonio Fundora López on 3/5/24.
//

import XCTest
@testable import RickMortyApp

final class ImageLoaderTest: XCTestCase {

    var sut: ImageLoaderViewModel!

    override func setUpWithError() throws {
        let bundle = Bundle(for: ImageLoaderTest.self)
        let fileURL: URL = bundle.url(forResource: "avatar52", withExtension: "jpeg")!
        sut = ImageLoaderViewModel(url: fileURL)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchImage() async throws {
        sut.image = nil
        //When
        await sut.loadImage()
        //Then
        XCTAssertNotNil(sut.image)
    }

    //Test that the image fetch fails when it is already running.
    func testFetchImageFail() async throws{
        //Given
        sut.image = nil
        sut.isLoading = true
        //When
        await sut.loadImage()
        //
        XCTAssertNil(sut.image)
    }

    @MainActor //Is mandatory main actor
    func testImageFetchingLoadingState() async throws {

        XCTAssertFalse(sut.isLoading)
        //Given: Initialize sut with fileURL
        let task = Task {  await sut.loadImage() }

        /// Yield the above task to ensure it's constructed and finished.
        await Task.yield()

        //When

        //Loading value must be true
        XCTAssertTrue(sut.isLoading, "Loading state should update")

        await task.value

        XCTAssertNotNil(sut.image, "Image should be loaded")
        //Then
        XCTAssertFalse(sut.isLoading, "Loading state should reset")
    }
}
