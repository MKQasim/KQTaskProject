//
//  KQHomeModels.swift
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


enum KQHome
{
  // MARK: Use cases

  enum Api
  {
    struct Request
    {
        var api_key : String
        var value   : String
    }
      // MARK: - Home
      struct Response {
          var code: Int?
          var message: String?
          var homeUsers : [Post]?
      }
      
    struct ViewModel
    {
        var users: [Post]?
    }
  }
}
