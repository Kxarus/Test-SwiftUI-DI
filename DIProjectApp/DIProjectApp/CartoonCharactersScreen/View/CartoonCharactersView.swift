//
//  CartoonCharactersView.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import SwiftUI

struct CartoonCharactersView: View {
    @ObservedObject var viewModel: CartoonCharactersViewModel
    
    var body: some View {
        if viewModel.isConnected {
            if viewModel.loadedCharacters.isEmpty {
                Text("No data")
            } else {
                List {
                    ForEach(viewModel.loadedCharacters) { item in
                        Text(item.name)
                    }
                }
            }
        } else {
            Text("Disconnected")
        }
    }
}

#Preview {
    CartoonCharactersView(
    viewModel: CartoonCharactersViewModel(
        api: CartoonApi(), //Теперь можно подставить моки
        manager: NetworkMonitor()) //Теперь можно подставить моки
    )
}
