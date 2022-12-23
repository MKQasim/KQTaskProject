//
//  KQHomeViewController.swift
//  KQTaskProject
//
//  Created by KamsQue on 22/12/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol KQHomeDisplayLogic: AnyObject
{
    func displayHomeList(viewModel: KQHome.Api.ViewModel)
    func stopApiCallSuccess(isCanceled:Bool)
}

class KQHomeViewController: KQSuperVC, KQHomeDisplayLogic
{
    
    
    var interactor: KQHomeBusinessLogic?
    var homeServices : HomeServices?
    var router: (NSObjectProtocol & KQHomeRoutingLogic & KQHomeDataPassing)?
    var selectedUser : User?
    // MARK: - Properties
    
    lazy var tableView : UITableView = {     // view
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(KQContactTableViewCell.self, forCellReuseIdentifier: KQContactTableViewCell.identifire)
        view.dataSource = self
        return  view
    }()
    
    private var homeUsers : [User]? // model
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = KQHomeInteractor()
        let presenter = KQHomePresenter()
        let router = KQHomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - SetUp Navigation
    private func setUpNavigation() {
        navigationItem.title = "Users List"
    }
    
    // MARK: - Private Actions
    private func configureUI() {
        // The .xib files should have the same name as the class file
        setTableViewConstraint()
        tableView.delegate = self
    }
    // MARK: - SetConstraint
    func setTableViewConstraint(){
        view.backgroundColor = AppTheme.shared.navBackgroundColor
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpNavigation()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.isUserInteractionEnabled = true
        homeApiRequestCall()
    }
    
    // MARK: Home Api Request Call
    
    func homeApiRequestCall()
    {
        let request = KQHome.Api.Request()
        LoadingOverlay.shared.showOverlay(view: self.view)
        LoadingOverlay.shared.activityIndicator.startAnimating()
        self.tableView.isUserInteractionEnabled = false
        interactor?.homeApiCall(request: request)
       
    }
    
    func displayHomeList(viewModel: KQHome.Api.ViewModel)
    {
        DispatchQueue.main.async() {
            self.homeUsers = viewModel.users
            self.tableView.reloadData()
            LoadingOverlay.shared.activityIndicator.stopAnimating()
            LoadingOverlay.shared.hideOverlayView()
            self.tableView.isUserInteractionEnabled = true
           
        }
    }
    
    func displayItemDetails(selectedUser:User?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            // your code here
            if var rout = self.router{
                rout.dataStore?.selectedUser = selectedUser
                rout.routeToDetails(segue: nil)
            }
        }
    }
    
    func stopApiCallStart(){
        interactor?.homestopApiCallStart()
    }
    
    func stopApiCallSuccess(isCanceled: Bool) {
        LoadingOverlay.shared.activityIndicator.stopAnimating()
        LoadingOverlay.shared.hideOverlayView()
        displayItemDetails(selectedUser: selectedUser)
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension KQHomeViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeUsers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KQContactTableViewCell.identifire, for: indexPath) as! KQContactTableViewCell
        cell.selectedUser = homeUsers?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedUser = homeUsers?[indexPath.row]
        if LoadingOverlay.shared.activityIndicator.isAnimating{
            stopApiCallStart()
        }else{
            displayItemDetails(selectedUser: selectedUser)
        }
    }
}

