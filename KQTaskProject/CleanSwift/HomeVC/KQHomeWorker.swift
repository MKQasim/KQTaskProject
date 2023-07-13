//
//  KQHomeWorker.swift
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
// MARK: - User List API

protocol UserListProtocol {
    // MARK: CRUD operations - Optional error
    
    func fetchOrders(completionHandler: @escaping ([User], UsersListError?) -> Void)
}

class KQHomeWorker {
    var usersList: UserListProtocol?
    init() {}
    
    func fetchOrders(completionHandler: @escaping ([User]) -> Void)
    {
        
    }
}

// MARK: - Orders store CRUD operation errors

enum UsersListError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

func ==(lhs: UsersListError, rhs: UsersListError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    default: return false
    }
}
