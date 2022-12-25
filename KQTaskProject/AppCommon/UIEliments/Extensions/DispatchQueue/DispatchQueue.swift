//
//  DispatchQue.swift
//  KQTaskProject
//
//  Created by KamsQue on 25/12/2022.
//

import Foundation


extension DispatchQueue {
    static func delay(_ delay: DispatchTimeInterval, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
