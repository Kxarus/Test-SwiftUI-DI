//
//  ServerApi.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation
import Combine

protocol ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> 
}
