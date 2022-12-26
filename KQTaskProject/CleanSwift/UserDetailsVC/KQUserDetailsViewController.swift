//
//  KQUserDetailsViewController.swift
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

protocol KQUserDetailsDisplayLogic: AnyObject
{
    func displayUserDetails(viewModel: KQUserDetailsModels.Model.ViewModel)
    func displayValidationError(isValidated:Bool)
    func checkApiUrlSerssion(isCanceled:Bool)
    func presenApiNetworkError(message: String?)
}

class KQUserDetailsViewController: KQSuperVC, KQUserDetailsDisplayLogic
{
   
    var interactor: KQUserDetailsBusinessLogic?
    var router: (NSObjectProtocol & KQUserDetailsRoutingLogic & KQUserDetailsDataPassing)?
    var selectedUser : User?
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
        let presenter = KQUserDetailsPresenter()
        let interactor = KQUserDetailsInteractor(presenter: presenter)
        let router = KQUsreDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
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
        addViews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.isUserInteractionEnabled = true
        getUserDetailsApiCall(selectedUser: router?.dataStore?.selectedUser)
    }
    
    // MARK: - SetUp Navigation
    private func setUpNavigation() {
        navigationItem.title = "User Details"
    }
    
    // MARK: @IBOutlet OR Views
    
    private lazy var superContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        img.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 2, alpha: 2)
        return img
    }()
    
    public lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = AppTheme.shared.titleTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var jobTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = AppTheme.shared.subTitleTextColor
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    var userDetails:UserDetails? {
        didSet {
//            DispatchQueue.main.async {
                guard let user = self.userDetails else {return}
                if let name = user.name {
                    self.nameLabel.text = "\(name)"
                }
                if let image = user.avatarURL , let url = URL(string:(image)) {
                    self.profileImageView.load(url: url)
                }
                if let twitterName = user.twitterUsername {
                    self.jobTitleDetailedLabel.text = "\(twitterName)"
                }
                if let image = user.avatarURL , let url = URL(string:(image)) {
                    self.countryImageView.load(url: url)
                }
                if LoadingOverlay.shared.activityIndicator.isAnimating{
                    LoadingOverlay.shared.activityIndicator.stopAnimating()
                    LoadingOverlay.shared.hideOverlayView()
                }
                self.view.isUserInteractionEnabled = false
//            }
        }
    }
    
    
    // MARK: Fetch User Details
    
    func getUserDetailsApiCall(selectedUser:User?){
        let request = KQUserDetailsModels.Model.Request(loginId: selectedUser?.login ?? "")
        LoadingOverlay.shared.showOverlay(view: self.view)
        LoadingOverlay.shared.activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        interactor?.getUserDetailsApi(request: request)
    }
    
    func displayValidationError(isValidated: Bool) {
        if !isValidated {
            if LoadingOverlay.shared.activityIndicator.isAnimating{
                LoadingOverlay.shared.activityIndicator.stopAnimating()
                LoadingOverlay.shared.hideOverlayView()
            }
            AlertHelper.showAlert("Alert",message: "Request Validation Error", style: .alert, actionTitles: ["Ok"],autoDismiss : true ,  dismissDuration: 10 ,showCancel: false  ) { action in
            }
        }
    }
    
    func displayUserDetails(viewModel: KQUserDetailsModels.Model.ViewModel)
    {
        userDetails = viewModel.userDetails
    }
    
    func presenApiNetworkError(message: String?) {
        if LoadingOverlay.shared.activityIndicator.isAnimating{
            LoadingOverlay.shared.activityIndicator.stopAnimating()
            LoadingOverlay.shared.hideOverlayView()
        }
        AlertHelper.showAlert("Alert",message: message!, style: .alert, actionTitles: [],autoDismiss : true ,  dismissDuration: 2 ,showCancel: false  ) { action in
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if LoadingOverlay.shared.activityIndicator.isAnimating{
            checkApiUrlSerssion()
        }
    }
    
    func checkApiUrlSerssion(){
        interactor?.checkApiUrlSerssion()
    }
    
    func checkApiUrlSerssion(isCanceled: Bool) {
        if LoadingOverlay.shared.activityIndicator.isAnimating{
            LoadingOverlay.shared.activityIndicator.stopAnimating()
            LoadingOverlay.shared.hideOverlayView()
        }
        self.view.isUserInteractionEnabled = false
    }
}

extension KQUserDetailsViewController{
    
    // MARK: - Add Views
    private func addViews(){
        view.backgroundColor = AppTheme.shared.navBackgroundColor
        self.view.addSubview(superContainerView)
        self.superContainerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.superContainerView.addSubview(containerView)
        self.superContainerView.addSubview(countryImageView)
    }
    
    // MARK: - Add Views Constraints
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            // MARK: - superContainerView Constraints
            
            superContainerView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:0),
            superContainerView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor, constant:0),
            superContainerView.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant:0),
            superContainerView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant:0),
            
            // MARK: - profileImageView Constraints
            profileImageView.topAnchor.constraint(equalTo:self.superContainerView.topAnchor,constant: 10),
            profileImageView.centerXAnchor.constraint(equalTo:self.superContainerView.centerXAnchor, constant:0),
            profileImageView.widthAnchor.constraint(equalToConstant:150),
            profileImageView.heightAnchor.constraint(equalToConstant:150),
            
            // MARK: -  containerView Constraints
            containerView.topAnchor.constraint(equalTo:self.profileImageView.bottomAnchor,constant: 10),
            containerView.leadingAnchor.constraint(equalTo:self.superContainerView.leadingAnchor , constant:0),
            containerView.trailingAnchor.constraint(equalTo:self.superContainerView.trailingAnchor, constant:0),
            containerView.heightAnchor.constraint(equalToConstant:100),
            // MARK: -  nameLabel Constraints
            nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor,constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -20),
            
            // MARK: - jobTitleDetailedLabel Constraints
            jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor, constant: 20),
            jobTitleDetailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -20),
            jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor,constant: 20),
            
            // MARK: - countryImageView Constraints
            countryImageView.widthAnchor.constraint(equalToConstant:50),
            countryImageView.heightAnchor.constraint(equalToConstant:50),
            countryImageView.bottomAnchor.constraint(equalTo:self.superContainerView.bottomAnchor, constant:0),
            countryImageView.centerXAnchor.constraint(equalTo:self.superContainerView.centerXAnchor),
        ])
    }
}
