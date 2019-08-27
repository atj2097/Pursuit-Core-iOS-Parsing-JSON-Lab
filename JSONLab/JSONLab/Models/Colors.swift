//
//  Colors.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation





struct Colors: Codable {
    let name: String
    let r: Float
    let g: Float
    let b: Float
    static func getColors(from data: Data) throws -> [Colors] {
        do {
            let colors = try JSONDecoder().decode([Colors].self, from: data)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }
}
