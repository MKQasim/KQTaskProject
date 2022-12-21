//
//  HomeVCPresenter.swift
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

protocol HomeVCPresentationLogic
{
  func presentSomething(response: HomeVC.Something.Response)
}

class HomeVCPresenter: HomeVCPresentationLogic
{
  weak var viewController: HomeVCDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: HomeVC.Something.Response)
  {
    let viewModel = HomeVC.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
