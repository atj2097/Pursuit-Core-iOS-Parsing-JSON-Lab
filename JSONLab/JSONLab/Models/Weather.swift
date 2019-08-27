//
//  Weather.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}


struct Weather: Codable {
    let name: String
//    let description: String
    static func getWeather(from data: Data) throws -> [Weather] {
        do {
            let weather = try JSONDecoder().decode([Weather].self, from: data)
            return weather
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}
