//
//  CartoonApi.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation
import Combine

struct CartoonApi: ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map { $0.data }
            .decode(type: ServerResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
