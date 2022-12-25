//
//  KQHomeViewControllerTests.swift
//  KQTaskProject
//
//  Created by KamsQue on 24/12/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import KQTaskProject
import XCTest

class KQHomeViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: KQHomeViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: KQHomeViewController())
        window.makeKeyAndVisible()
        setupKQHomeViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupKQHomeViewController()
    {
        sut = KQHomeViewController()
        sut.viewDidLoad()
        sut.viewWillAppear(true)
    }
    
    func loadView()
    {
        window.addSubview(UINavigationController(rootViewController: sut).view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class KQHomeListUsersBusinessLogicSpy: KQHomeBusinessLogic
    {
        var users: [User]?
        
        // MARK: Method call expectations
        
        var fetchUsersCalled = false
        
        // MARK: Spied methods
        
        func fetchUsers(request: KQTaskProject.KQHome.HomeUsers.Request) {
            fetchUsersCalled = true
        }
        
        func homestopApiCallStart() {}
        func stopUrlSessionInit() {}
    }
    class TableViewSpy: UITableView
    {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFetchUsersWhenViewWillAppear()
    {
        // Given
        let kqHomeListUsersBusinessLogicSpy = KQHomeListUsersBusinessLogicSpy()
        sut.interactor = kqHomeListUsersBusinessLogicSpy
        loadView()
        
        // When
        sut.viewWillAppear(true)
        
        // Then
        XCTAssert(kqHomeListUsersBusinessLogicSpy.fetchUsersCalled, "Should fetch Users right after the view appears")
    }
    
    func testShouldDisplayFetchedUsers()
    {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        // When
        
        let displayUsers = KQHome.HomeUsers.ViewModel(users: [User(login: "Login",url: "www.google.com")])
        let viewModel = KQHome.HomeUsers.ViewModel(users: displayUsers.users)
        sut.displayFetchedUsers(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(sut.displayUsers!.first!.login == "Login")
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne()
    {
        // Given
        let tableView = sut.tableView
        
        // When
        let numberOfSections = tableView.numberOfSections
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
    
    func testNumberOfRowsInAnySectionShouldEqaulNumberOfUsersToDisplay()
    {
        // Given
        let tableView = sut.tableView
        let testDisplayUsers = [User(login: "Login",url: "google.com")]
        
        sut.displayUsers = testDisplayUsers
        
        // When
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayUsers.count, "The number of table view rows should equal the number of Users to display")
    }
    
    func testShouldConfigureTableViewCellToDisplayUser()
    {
        // Given
        
        let tableView = sut.tableView
        let testDisplayUsers = [User(login: "Login",url: "google.com")]
        sut.displayUsers = testDisplayUsers
        // When
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView, cellForRowAt: indexPath) as! KQContactTableViewCell
        
        // Then
        
        XCTAssertEqual(cell.nameLabel.text!, "Login:Login", "A properly configured table view cell should display the Users Login")
        XCTAssertEqual(cell.jobTitleDetailedLabel.text!, "google.com", "A properly configured table view cell should display the Users url")
    }
}
