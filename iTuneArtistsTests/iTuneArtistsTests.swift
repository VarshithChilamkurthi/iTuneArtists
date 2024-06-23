//
//  iTuneArtistsTests.swift
//  iTuneArtistsTests
//
//  Created by Varshith Chilamkurthi on 17/06/24.
//

import XCTest
@testable import iTuneArtists

final class iTuneArtistsTests: XCTestCase {
    
    var mockArtistsViewModelObj: MockArtistsViewModel?
    var artistsViewModelObj: ArtistsViewModel?
    var apiManagerObj: APIManager?

    override func setUpWithError() throws {
        mockArtistsViewModelObj = MockArtistsViewModel()
        artistsViewModelObj = ArtistsViewModel()
    }

    override func tearDownWithError() throws {
        mockArtistsViewModelObj = nil
        artistsViewModelObj = nil
        apiManagerObj = nil
    }
    
    func testFetchDataMock() throws {
        mockArtistsViewModelObj?.fetchData(url: "none") {}
        XCTAssertEqual(mockArtistsViewModelObj?.artists.count, 2)
    }
    
    func testFetchDataInvalidUrl() throws {
        artistsViewModelObj?.fetchData(url: "invalidUrl") {}
        XCTAssertEqual(artistsViewModelObj?.artists.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
