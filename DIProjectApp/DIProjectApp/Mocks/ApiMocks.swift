//
//  ApiMocks.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation
import Combine

struct EmptyServerResponse: ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> {
        Just([]).eraseToAnyPublisher()
    }
}

struct MockServerResponse: ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> {
        Just([
            CartoonCharacter(id: 1, name: "Roman"),
            CartoonCharacter(id: 2, name: "Dima")
        ]).eraseToAnyPublisher()
    }
}
