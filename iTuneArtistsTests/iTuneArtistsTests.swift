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
    var mockApiManagerObj: MockApiManager?

    override func setUpWithError() throws {
        mockArtistsViewModelObj = MockArtistsViewModel()
        artistsViewModelObj = ArtistsViewModel()
    }

    override func tearDownWithError() throws {
        mockArtistsViewModelObj = nil
        artistsViewModelObj = nil
        apiManagerObj = nil
        mockApiManagerObj = nil
    }
    
    func testGetApiDataEmptyUrl() throws {
        let result: ()? = apiManagerObj?.getApiData(url: "") {_ in }
        XCTAssertNil(result)
    }
    
    func testFetchData() throws {
        artistsViewModelObj?.fetchData(url: "invalidUrl") {}
        XCTAssertEqual(artistsViewModelObj?.artists.count, 0)
    }
    
    func testFetchDataReturnsNil() throws {
        let result: ()? = mockApiManagerObj?.getApiData(url: "invalidUrl") {_ in }
        XCTAssertNil(result)
    }
    
//    func testFetchDataInvalidData() throws {
//        mockArtistsViewModelObj?.fetchData(url: "invalidUrl") {
//            apiManagerObj?.getApiData(url: "url") { Data() in }
//        }
////        XCTAssertNil(result)
//    }
    
    func testFetchDataMock() throws {
        mockArtistsViewModelObj?.fetchData(url: "none") {}
        XCTAssertEqual(mockArtistsViewModelObj?.artists.count, 2)
    }
    
    func testFetchDataInvalidUrl() throws {
        artistsViewModelObj?.fetchData(url: "invalidUrl") {}
        XCTAssertEqual(artistsViewModelObj?.artists.count, 0)
    }
    
    func testFetchDataFailedDecode() throws {
        artistsViewModelObj?.decodeData(data: Data())
        XCTAssertEqual(artistsViewModelObj?.artists.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
