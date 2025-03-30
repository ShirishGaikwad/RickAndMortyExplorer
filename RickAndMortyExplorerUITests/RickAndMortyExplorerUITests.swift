//
//  RickAndMortyExplorerUITests.swift
//  RickAndMortyExplorerUITests
//
//  Created by shirish gayakawad on 30/03/25.
//

import XCTest
/*
final class RickAndMortyExplorerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
*/
import XCTest

final class RickAndMortyExplorerUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Initialize the application
        app = XCUIApplication()
        app.launch()
        
        // Continue after failure
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTabBarNavigation() {
        // Verify if the Tab Bar is functional
        let charactersTab = app.tabBars.buttons["Characters"]
        let locationsTab = app.tabBars.buttons["Locations"]
        let episodesTab = app.tabBars.buttons["Episodes"]
        
        XCTAssertTrue(charactersTab.exists)
        XCTAssertTrue(locationsTab.exists)
        XCTAssertTrue(episodesTab.exists)

        // Tap and verify tabs
        charactersTab.tap()
        XCTAssertTrue(app.navigationBars["Characters"].exists)

        locationsTab.tap()
        XCTAssertTrue(app.navigationBars["Locations"].exists)

        episodesTab.tap()
        XCTAssertTrue(app.navigationBars["Episodes"].exists)
    }

    func testCharacterDetailNavigation() {
        let charactersTab = app.tabBars.buttons["Characters"]
        XCTAssertTrue(charactersTab.exists, "Characters tab should exist")
        charactersTab.tap()

        let collectionView = app.collectionViews.firstMatch
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: collectionView, handler: nil)
        waitForExpectations(timeout: 15, handler: nil) // Increased timeout

        XCTAssertTrue(collectionView.exists, "CollectionView should exist")

        // Tap the first cell
        let firstCharacter = collectionView.cells.element(boundBy: 0)
        XCTAssertTrue(firstCharacter.waitForExistence(timeout: 5), "First character cell should exist")
        firstCharacter.tap()

        // Verify navigation to detail screen
        let detailNavigationBar = app.navigationBars.element
        XCTAssertTrue(detailNavigationBar.waitForExistence(timeout: 5), "Detail navigation bar should exist")
        XCTAssertFalse(detailNavigationBar.staticTexts.element.label.isEmpty, "Navigation bar title should not be empty")
    }



}
