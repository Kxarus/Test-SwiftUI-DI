//
//  DIProjectAppApp.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import SwiftUI

@main
struct DIProjectAppApp: App {
    var body: some Scene {
        WindowGroup {
            CartoonCharactersView(
                viewModel: CartoonCharactersViewModel(
                    api: CartoonApi(),
                    manager: NetworkMonitor()
                )
            )
        }
    }
}
