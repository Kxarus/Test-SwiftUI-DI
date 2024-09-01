//
//  CartoonCharactersViewModel.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation
import SwiftUI
import Network
import Combine

class CartoonCharactersViewModel: ObservableObject {
    
    @Published var loadedCharacters: [CartoonCharacter] = []
    @Published var isConnected = true
    
    private let manager = NWPathMonitor()
    private var disposeBag: Set<AnyCancellable> = []
    
    init() {
        manager.pathUpdateHandler = onPathUpdate
        manager.start(queue: DispatchQueue.main)
    }
    
    private func onPathUpdate(path: NWPath) {
        isConnected = path.status == .satisfied
        
        if isConnected {
            refreshData()
        } else {
            loadedCharacters = []
        }
    }
    
    private func refreshData() {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map { $0.data }
            .decode(type: ServerResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { cartoon in
                self.loadedCharacters = cartoon
            }
            .store(in: &disposeBag)
    }
}
