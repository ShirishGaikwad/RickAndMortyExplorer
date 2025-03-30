//
//  RickAndMortyExplorerTests.swift
//  RickAndMortyExplorerTests
//
//  Created by shirish gayakawad on 30/03/25.
//

/*import XCTest

final class RickAndMortyExplorerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
*/
import XCTest
@testable import RickAndMortyExplorer

final class RickAndMortyExplorerTests: XCTestCase {

    var charactersViewModel: CharactersViewModel!
    var locationsViewModel: LocationsViewModel!
    var episodesViewModel: EpisodesViewModel!
    
    override func setUpWithError() throws {
        // Initialize view models
        charactersViewModel = CharactersViewModel()
        locationsViewModel = LocationsViewModel()
        episodesViewModel = EpisodesViewModel()
    }

    override func tearDownWithError() throws {
        // Cleanup
        charactersViewModel = nil
        locationsViewModel = nil
        episodesViewModel = nil
    }

    func testFetchCharacters() {
        let expectation = XCTestExpectation(description: "Fetch Characters")
        
        APIClient.fetchData(url: "https://rickandmortyapi.com/api/character") { (response: APIResponse<Character>?) in
            XCTAssertNotNil(response, "Response should not be nil")
            XCTAssertTrue(response?.results.count ?? 0 > 0, "Characters list should not be empty")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchLocations() {
        let expectation = XCTestExpectation(description: "Fetch Locations")
        
        APIClient.fetchData(url: "https://rickandmortyapi.com/api/location") { (response: APIResponse<Location>?) in
            XCTAssertNotNil(response, "Response should not be nil")
            XCTAssertTrue(response?.results.count ?? 0 > 0, "Locations list should not be empty")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchEpisodes() {
        let expectation = XCTestExpectation(description: "Fetch Episodes")
        
        APIClient.fetchData(url: "https://rickandmortyapi.com/api/episode") { (response: APIResponse<Episode>?) in
            XCTAssertNotNil(response, "Response should not be nil")
            XCTAssertTrue(response?.results.count ?? 0 > 0, "Episodes list should not be empty")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
