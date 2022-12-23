//
//  KQTaskProjectUITests.swift
//  KQTaskProjectUITests
//
//  Created by KamsQue on 21/12/2022.
//

@testable import KQTaskProject
import XCTest

class KQTaskProjectUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testValidateHomeList(){
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Login : ezmobius"]/*[[".cells.staticTexts[\"Login : ezmobius\"]",".staticTexts[\"Login : ezmobius\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
            let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        let updatedAt202212221211350000StaticText = app.staticTexts["Updated At: 2022-12-22 12:11:35 +0000"]
        updatedAt202212221211350000StaticText.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        updatedAt202212221211350000StaticText.tap()
        element.tap()
        element.tap()
        element.tap()
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
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

