//
//  iTuneArtistsTests.swift
//  iTuneArtistsTests
//
//  Created by Varshith Chilamkurthi on 17/06/24.
//

import XCTest
@testable import iTuneArtists

final class iTuneArtistsTests: XCTestCase {
    
    var apiManagerObj: APIManager?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testGetApiData() throws {
//        let result = apiManagerObj?.getApiData(url: "someurl") { Model in
//            
//        }
//        XCTAssertEqual(result, "Fizz")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
