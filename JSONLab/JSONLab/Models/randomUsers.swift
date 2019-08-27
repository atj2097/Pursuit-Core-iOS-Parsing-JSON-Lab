//
//  randomUsers.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import Foundation


struct Users: Codable {
    let username: String
    let age: Int
    static func getUsers(from data: Data) throws -> [Users] {
        do {
            let users = try JSONDecoder().decode([Users].self, from: data)
            return users
        } catch {
            throw JSONError.decodingError(error)
        }
    }
    
}
