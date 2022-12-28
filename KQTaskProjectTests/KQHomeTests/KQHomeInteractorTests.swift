//
//  KQHomeInteractorTests.swift
//  KQTaskProjectTests
//
//  Created by KamsQue on 24/12/2022.
//

import XCTest
@testable import KQTaskProject

class KQHomeInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: KQHomeInteractor!
    let presentationSpy = KQHomePresentationLogicSpy()
    let homeBusiness = HomeBusiness()
    let worker = KQHomeWorker()
    let homeBussinessLogicSpy = KQHomeBusinessLogicSpy()
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
        var urlSessionisValid = false
        var urlSessionInvalidated = false
        var presenApiNetworkError = false
        
        func presentUsers(response: KQTaskProject.KQHome.HomeUsers.Response) {
            presentFetchedUsersCalled = true
            users = response.homeUsers
            XCTAssertNotNil(response.homeUsers)
        }
        
        func checkApiUrlSerssion(isCanceled: Bool) {
            if isCanceled{
                urlSessionInvalidated = true
            }else{
                urlSessionisValid = false
            }
        }
        
        func presenApiNetworkError(message: String?) {
            presenApiNetworkError = true
        }
    }
    
    class KQHomeBusinessLogicSpy: KQHomeBusinessLogic {
        
       
        var users : [User]?
        var homeFetchedUsersCalled = false
        var checkUrlSessionisCalled = false
        
        func fetchUsers(request: KQHome.HomeUsers.Request) {
            homeFetchedUsersCalled = true
        }
        
        func checkApiUrlSerssion() {
            checkUrlSessionisCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testFetchUsersShouldAskToFetchUsers()
    {
      // Given
        let request = KQHome.HomeUsers.Request()
      // When
        homeBussinessLogicSpy.fetchUsers(request: request)
      
      // Then
        XCTAssertTrue(homeBussinessLogicSpy.homeFetchedUsersCalled, "FetchOrders() should ask to fetch Users List")
    }
    
    func testcheckApiUrlSerssionIfAnySessionIsThereToInvalidate()
    {
      
      // When
        homeBussinessLogicSpy.checkApiUrlSerssion()
      
      // Then
        XCTAssertTrue(homeBussinessLogicSpy.checkUrlSessionisCalled, "checkApiUrlSerssion() should check Api UrlSerssion If AnySession Is There To Invalidate before Moving next Screen")
    }
    
    
    func testResultShouldFormatedByPresenter()
    {
        // Given
        sut.presenter = presentationSpy
        let response = KQHome.HomeUsers.Response(homeUsers: [User(login: "Login",url: "www.google.com")])
        // When
        sut.presenter?.presentUsers(response: response)
        // Then
        XCTAssertEqual(presentationSpy.users?.count == 1, true)
        XCTAssertTrue(presentationSpy.users?.first?.login == "Login")
        XCTAssertTrue(presentationSpy.presentFetchedUsersCalled, "presentUsers should ask the presenter to format the result")
    }
    
    func testValidateSuccessUrlSessionIfStartedBeforeMovingNextScreenDuringIfPaginationImplimented()
    {
        // Given
        sut.presenter = presentationSpy
        let isInvalidate = true
        // When
        sut.presenter?.checkApiUrlSerssion(isCanceled: isInvalidate)
        // Then
        XCTAssertTrue(presentationSpy.urlSessionInvalidated, "Presenting fetched users should ask view controller to check url Session Validation Success")
    }
    
    func testValidateErrorUrlSessionIfStartedBeforeMovingNextScreenDuringIfPaginationImplimented()
    {
        // Given
        sut.presenter = presentationSpy
        let isInvalidate = true
        // When
        sut.presenter?.checkApiUrlSerssion(isCanceled: isInvalidate)
        // Then
        XCTAssertFalse(presentationSpy.urlSessionisValid, "Presenting fetched users should ask view controller to check urlSession Validation Success")
    }
}
