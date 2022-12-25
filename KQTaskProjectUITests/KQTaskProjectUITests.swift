//
//  KQTaskProjectUITests.swift
//  KQTaskProjectUITests
//
//  Created by KamsQue on 23/12/2022.
//
@testable import KQTaskProject

import XCTest

final class KQTaskProjectUITests: XCTestCase {
    
    //    override func setUpWithError() throws {
    //        // Put setup code here. This method is called before the invocation of each test method in the class.
    //
    //        // In UI tests it is usually best to stop immediately when a failure occurs.
    //        continueAfterFailure = false
    //
    //        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    //    }
    
    //    override func tearDownWithError() throws {
    //        // Put teardown code here. This method is called after the invocation of each test method in the class.
    //    }
    //
    //    func testFirstScreenValidation(){
    ////        let app = XCUIApplication()
    ////        XCTAssert(app.navigationBars["New Todo"].exists
    ////         && app.staticTexts["Todo Title:"].exists
    ////         && app.buttons[DoneButtonIdentifier].exists)
    //
    ////        XCTAssertTrue(XCUIApplication().navigationBars["User Details"].waitForExistence(timeout: 10))
    ////
    //
    ////        let app = XCUIApplication()
    //        //        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    ////        element.tap()
    //        //        element.tap()
    ////        element.tap()
    ////        element.tap()
    //
    ////        let app = XCUIApplication()
    ////        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    ////        element.tap()
    ////        element.tap()
    ////        element.tap()
    ////        element.tap()
    ////        element.tap()
    ////        element.tap()
    ////        app.navigationBars["User Details"].buttons["Users List"].tap()
    ////
    ////        let usersListStaticText = XCUIApplication().navigationBars["Users List"].staticTexts["Users List"]
    ////        usersListStaticText.tap()
    ////        usersListStaticText.tap()
    ////        usersListStaticText.tap()
    ////        usersListStaticText.tap()
    ////                //        element.tap()
    //////        element.tap()
    //        ////        app.navigationBars["User Details"].buttons["Users List"].tap()
    //////        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    ////     XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //
    //        XCUIApplication().cells
    //          .containing(.staticText, identifier: "Login:mojombo")
    //          .firstMatch
    //          .tap()
    //
    //        let app = XCUIApplication()
    //        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    //        element.tap()
    //        element.tap()
    //        element.tap()
    //        element.tap()
    //        element.tap()
    //        element.tap()
    //        element.tap()
    //        element.swipeUp()
    //        element.swipeDown()
    //        element.swipeUp()
    //        element.swipeRight()
    //        element.swipeLeft()
    //        element/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    //        element.tap()
    //        app.navigationBars["User Details"].buttons["Users List"].tap()
    //        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
    //
    //    }
    
    func testExample() throws {
        continueAfterFailure = true
        XCUIApplication().navigationBars["User Details"].buttons["Users List"].tap()
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["User Details"].buttons["Users List"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //                        measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
}
