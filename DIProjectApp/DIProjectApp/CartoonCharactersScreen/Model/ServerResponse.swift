//
//  ServerResponse.swift
//  DIProjectApp
//
//  Created by Roman Kiruxin on 01.09.2024.
//

import Foundation

struct ServerResponse: Decodable {
    let results: [CartoonCharacter]
}
