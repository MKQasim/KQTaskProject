  //
  //  KQTaskProjectUITests.swift
  //  KQTaskProjectUITests
  //
  //  Created by KamsQue on 23/12/2022.
  //
@testable import KQTaskProject
import XCTest

final class KQTaskProjectUITests: XCTestCase {

  
  func testNavigationToDetailsScreen() {
      // Given
    let app = XCUIApplication()
    
      // When
    app.launch()
    app.launchArguments = ["enable-testing"]
    let homeTableView = app.tables["HomeTableView"]
        
      // Then
    XCTAssertTrue(app.exists)
    XCTAssertTrue(app.kqUserHomeViewController.waitForExistence(timeout: 5))
    
    let cell = homeTableView.cells.firstMatch
    cell.tap()
    XCTAssertTrue(app.navigationBars["User Details"].waitForExistence(timeout: 5))
  }
  
  func testTableViewList() {
              // Given
    let app = XCUIApplication()
    app.launch()
    app.launchArguments = ["enable-testing"]
    
      // When
    let homeTableView = app.tables["HomeTableView"]
    
      // Then
    XCTAssertTrue(app.exists)
    XCTAssertTrue(homeTableView.waitForExistence(timeout: 5))
  }
  
  func testTableViewCellTap() {
      // Given
    let app = XCUIApplication()
    app.launch()
    app.launchArguments = ["enable-testing"]
    let homeTableView = app.tables["HomeTableView"]
    
      // When
    let cell = homeTableView.cells.firstMatch
    cell.tap()
    
      // Then
    XCTAssertTrue(app.exists)
    XCTAssertTrue(app.otherElements["KQUserDetailsViewController"].waitForExistence(timeout: 5))
    XCTAssertTrue(app.otherElements["SuperDetailsContainerView"].waitForExistence(timeout: 5))
    XCTAssertTrue(app.otherElements["DetailsContainerView"].waitForExistence(timeout: 5))
    XCTAssertTrue(app.staticTexts["nameLabel"].waitForExistence(timeout: 5))
  }
  
  func testDetailsScreenComponents() {
      // Given
    let app = XCUIApplication()
    app.launch()
    app.launchArguments = ["enable-testing"]
    let homeTableView = app.tables["HomeTableView"]
    let cell = homeTableView.cells.firstMatch
    cell.tap()
      // When
    let kqUserDetailsViewController = app.otherElements["KQUserDetailsViewController"]
    let superContainerView = app.otherElements["SuperDetailsContainerView"]
    let containerView = app.otherElements["DetailsContainerView"]
    let nameLabel = app.staticTexts["nameLabel"]
    
      // Then
    XCTAssertTrue(app.exists)
    XCTAssertTrue(kqUserDetailsViewController.waitForExistence(timeout: 5))
    XCTAssertTrue(superContainerView.waitForExistence(timeout: 5))
    XCTAssertTrue(containerView.waitForExistence(timeout: 5))
    XCTAssertTrue(nameLabel.waitForExistence(timeout: 5))
  }
  
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
        // Given
      let app = XCUIApplication()
      
        // When
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        app.launch()
      }
      
        // Then
      XCTAssertTrue(app.exists)
    }
  }
}

// MARK: - KQHomeViewController UIComponents

private extension XCUIApplication {
  
  var kqUserHomeViewController: XCUIElement { self.otherElements["KQHomeViewController"] }
  var homeTableView: XCUIElement { self.otherElements["HomeTableView"] }
  var homeCell: XCUIElement { self.otherElements["HomeTableView"].cells.firstMatch }

}
  // MARK: - KQUserDetailsViewController UIComponents

private extension XCUIApplication {

  var kqUserDetailsViewController: XCUIElement { self.otherElements["KQUserDetailsViewController"] }
  var superContainerView: XCUIElement { self.otherElements["SuperDetailsContainerView"] }
  var containerView: XCUIElement { self.otherElements["DetailsContainerView"] }
  var nameLabel: XCUIElement { self.staticTexts["nameLabel"] }
}




