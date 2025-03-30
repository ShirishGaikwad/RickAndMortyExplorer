//
//  Character.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let results: [T]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
}
struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
}
