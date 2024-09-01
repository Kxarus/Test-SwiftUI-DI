//
//  NetworkMonitor.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation
import Network

class NetworkMonitor: WIFIManager {
    var callback: ((Bool) -> Void)?
    
    private let monitor = NWPathMonitor()
    
    init() {
        monitor.pathUpdateHandler = onUpdate
    }
    
    func start() {
        monitor.start(queue: DispatchQueue.main)
    }
    
    private func onUpdate(path: NWPath) {
        callback?(path.status == .satisfied)
    }
}
