//
//  KQTaskProjectUITests.swift
//  KQTaskProjectUITests
//
//  Created by KamsQue on 23/12/2022.
//
@testable import KQTaskProject

import XCTest

final class KQTaskProjectUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testListScreenUI(){
        continueAfterFailure = true
        let app = XCUIApplication()
        app.launch()
        app.launchArguments = ["enable-testing"]
        XCTAssertTrue(app.exists)
    }
    
    func testFirstScreen(){
        continueAfterFailure = true
        let app = XCUIApplication()
        app.launch()
        let kqhomeviewcontrollerElement = app.otherElements["KQHomeViewController"]
        XCTAssertTrue(kqhomeviewcontrollerElement.waitForExistence(timeout: 5))
        let kqtableViewrElement = app.otherElements.element(boundBy: 0)
        XCTAssertTrue(kqtableViewrElement.waitForExistence(timeout: 5))
    }
    
    func testNavigateToDetailsScreen(){
        continueAfterFailure = true
        let app = XCUIApplication()
        app.launch()
        app.launchArguments = ["enable-testing"]
        let kqhomeviewcontrollerElement = app.otherElements["KQHomeViewController"]
        XCTAssertTrue(kqhomeviewcontrollerElement.waitForExistence(timeout: 5))
        
        let nav = XCUIApplication().navigationBars["Users List"]
        XCTAssertTrue(nav.exists)
    }
    
    func testSecondScreen(){
        continueAfterFailure = true
        let app = XCUIApplication()
        app.launch()
        app.launchArguments = ["enable-testing"]
        XCTAssertTrue(XCUIApplication().navigationBars["Users List"].exists)
        
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
