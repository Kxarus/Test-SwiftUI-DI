//
//  WifiMocks.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation

struct AllGood: WIFIManager {
    var callback: ((Bool) -> Void)?
    
    func start() {
        callback?(true)
    }
}

struct NoWiFi: WIFIManager {
    var callback: ((Bool) -> Void)?
    
    func start() {
        callback?(false)
    }
}
