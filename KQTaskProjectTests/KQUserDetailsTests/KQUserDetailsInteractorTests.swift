//
//  KQUserDetailsInteractorTests.swift
//  KQTaskProject
//
//  Created by KamsQue on 25/12/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import KQTaskProject
import XCTest

class KQUserDetailsInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: KQUserDetailsInteractor!
    let presentationSpy = KQUserDetailsPresentationLogicSpy()
    let userBusiness = UserBusiness()
    let worker = KQUserDetailsWorker()
    let userDetailsBusinessLogicSpy = KQUserDetailsBusinessLogicSpy()
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupKQUserDetailsInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupKQUserDetailsInteractor()
    {
        sut = KQUserDetailsInteractor(userBusiness: userBusiness, presenter: presentationSpy)
        
    }
    
    
    // MARK: Test doubles
    
    
    class KQUserDetailsBusinessLogicSpy: KQUserDetailsBusinessLogic {
      
        var userDetails : UserDetails?
        var isGetUserDetailsApiCalled = false
        var isdisplayUserDataCalled = false
        var checkIsUrlSessionisCalled = false
        
        
        func displayUserData(response: KQUserDetailsModels.Model.Response) {
            userDetails = response.userDetails
            isdisplayUserDataCalled = true
        }
        
        func getUserDetailsApi(request: KQUserDetailsModels.Model.Request) {
            isGetUserDetailsApiCalled = true
        }
        
        func checkApiUrlSerssion() {
            checkIsUrlSessionisCalled = true
        }
        
    }
    
    class KQUserDetailsPresentationLogicSpy: KQUserDetailsPresentationLogic
    {
        
        
        var userDetails : UserDetails?
        var presentFetchedUsersCalled = false
        var displayValidationError = false
        var displayValidationSuccess = false
        var urlSessionisValid = false
        var urlSessionInvalidated = false
        var presenApiNetworkError = false
        
        func presentUserDetails(response: KQUserDetailsModels.Model.Response) {
            presentFetchedUsersCalled = true
            userDetails = response.userDetails
            XCTAssertNotNil(response.userDetails)
        }
        
        func presentRequestValidationError(isValidated: Bool) {
         
            if isValidated{
                displayValidationSuccess = isValidated
            }else{
                displayValidationError = isValidated
            }
        }
        
        func checkApiUrlSerssion(isCanceled: Bool) {
            print(isCanceled)
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
    
    // MARK: Tests
    
    
    func testFetchUserDetailsShouldAskToFetchUserDetails()
    {
      // Given
        let loginId = "mojombo"
        let request = KQUserDetailsModels.Model.Request(loginId: loginId)
      // When
        userDetailsBusinessLogicSpy.getUserDetailsApi(request: request)
      
      // Then
        XCTAssertTrue(userDetailsBusinessLogicSpy.isGetUserDetailsApiCalled, "getUserDetailsApi() should ask to get User Details")
    }
    
    func testDisplayUserData()
    {
      // Given
        let response = KQUserDetailsModels.Model.Response(selectedUser: User(login: "Login",url: "www.google.com"), userDetails: UserDetails(name: "MyName",twitterUsername: "Twitter Name"))
      // When
        userDetailsBusinessLogicSpy.displayUserData(response: response)
          
      // Then
        XCTAssertEqual(userDetailsBusinessLogicSpy.userDetails?.name, "MyName", "A properly configured TitleName should display the Users Twitter Name ")
        XCTAssertEqual(userDetailsBusinessLogicSpy.userDetails?.twitterUsername, "Twitter Name", "A properly configured TitleName should display the Users Twitter Name ")
        XCTAssertTrue(((userDetailsBusinessLogicSpy.userDetails?.twitterUsername) != nil), "Twitter Name")
    }
    
    func testCheckApiUrlSerssion()
    {
        // Given
        // When
        userDetailsBusinessLogicSpy.checkApiUrlSerssion()
      // When
      
      // Then
        XCTAssertTrue(userDetailsBusinessLogicSpy.checkIsUrlSessionisCalled, "getUserDetailsApi() should ask to get User Details")
    }
    
    
    func testPresentFetchedUsersValidationSuccessShouldAskViewControllerToDisplayFetchedUsers()
    {
        
        // Given
        sut.presenter = presentationSpy
        let isValidated = true
        // When
        
        sut.presenter?.presentRequestValidationError(isValidated: isValidated)
        // Then
        
        XCTAssertTrue(presentationSpy.displayValidationSuccess, "Presenting fetched users should ask view controller to display Validation Success")
    }
    
    func testPresentFetchedUsersValidationErrorShouldAskViewControllerToDisplayFetchedUsers()
    {
        // Given
        sut.presenter = presentationSpy
        let isValidated = false
        // When
        
        sut.presenter?.presentRequestValidationError(isValidated: isValidated)
        // Then
        
        XCTAssertFalse(presentationSpy.displayValidationError, "Presenting fetched users should ask view controller to display Validation Error")
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
        let isInvalidate = false
        // When
        sut.presenter?.checkApiUrlSerssion(isCanceled: isInvalidate)
        // Then
        XCTAssertFalse(presentationSpy.urlSessionisValid, "Presenting fetched users should ask view controller to check urlSession Validation Success")
    }
    
    func testResultShouldFormatedByPresenter()
    {
        // Given
        sut.presenter = presentationSpy
        let response = KQUserDetailsModels.Model.Response(selectedUser: User(login: "Login",url: "www.google.com"), userDetails: UserDetails(name: "MyName",twitterUsername: "Twitter Name"))
        // When
        sut.displayUserData(response: response)
        // Then
        
        XCTAssertEqual(presentationSpy.userDetails?.name, "MyName", "A properly configured TitleName should display the Users Twitter Name ")
        XCTAssertEqual(presentationSpy.userDetails?.twitterUsername, "Twitter Name", "A properly configured TitleName should display the Users Twitter Name ")
        XCTAssertTrue(((presentationSpy.userDetails?.twitterUsername) != nil), "Twitter Name")

    }

}
