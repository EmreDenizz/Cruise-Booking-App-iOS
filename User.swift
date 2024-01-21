//
//  User.swift
//
//  Created by Emre Deniz on 2024-01-24.
//

import Foundation

class User{
    var id: Int
    var first_name: String
    var last_name: String
    var email: String
    var password: String
    var address: String
    var city: String
    var country: String
    
    init(id: Int, first_name: String, last_name: String, email: String,
         password: String, address: String, city: String, country: String) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.password = password
        self.address = address
        self.city = city
        self.country = country
    }
}
