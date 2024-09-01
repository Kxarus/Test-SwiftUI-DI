//
//  WIFIManager.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation

protocol WIFIManager {
    var callback: ((Bool) -> Void)? { get set }
    
    func start()
}
