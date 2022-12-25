//
//  KQHomeInteractorTests.swift
//  KQTaskProjectTests
//
//  Created by KamsQue on 24/12/2022.
//

import XCTest
@testable import KQTaskProject


class KQHomePresentationLogicSpy: KQHomePresentationLogic {
    var presentFetchedUsersCalled = false
    func presentUsers(response: KQTaskProject.KQHome.HomeUsers.Response) {
        presentFetchedUsersCalled = true
        XCTAssertNotNil(response.homeUsers)
        XCTAssertTrue(response.homeUsers?.count == 1)
        XCTAssertTrue(response.homeUsers!.first!.login == "Qasim")
    }
    
    func stopUrlSession(isCanceled: Bool) {
        
    }
}

class KQHomeInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: KQHomeInteractor!
    let presentationSpy = KQHomePresentationLogicSpy()
    let homeBusiness = HomeBusiness()
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupKQHomeInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupKQHomeInteractor()
    {
        sut = KQHomeInteractor(homeBusiness: homeBusiness, presenter: presentationSpy)
    }
    
    // MARK: Test doubles
    
    class KQHomePresentationLogicSpy: KQHomePresentationLogic {
        var users : [User]?
        var presentFetchedUsersCalled = false
        func presentUsers(response: KQTaskProject.KQHome.HomeUsers.Response) {
            presentFetchedUsersCalled = true
            users = response.homeUsers
            XCTAssertNotNil(response.homeUsers)
            //        XCTAssertTrue(response.homeUsers?.count == 1)
            //        XCTAssertTrue(response.homeUsers!.first!.login == "Qasim")
        }
        
        func stopUrlSession(isCanceled: Bool) {
            
        }
    }
    
    // MARK: Tests
    
    func testResultShouldFormatedByPresenter()
    {
        // Given
        sut.presenter = presentationSpy
        let request = KQHome.HomeUsers.Request()
        // When
        sut.fetchUsers(request: request)
        // Then
        XCTAssertEqual(presentationSpy.users?.count == 1, true)
        XCTAssertTrue(presentationSpy.users?.first?.login == "Qasim")
        XCTAssertTrue(presentationSpy.presentFetchedUsersCalled, "fetchUsers(request:) should ask the presenter to format the result")
    }
}
