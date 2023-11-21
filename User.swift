//
//  User.swift
//  Team3_MAPD714_Project-Milestone2
//
//  @author Emre Deniz (301371047)
//  @author Nkemjika Obi (301275091)
//  @author Muindo Gituku (301372521)
//  @date 2023-11-27
//  @description iOS Project - Milestone 4
//  Github Repo: https://github.com/EmreDenizz/Cruise-Booking-App-iOS
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
        self.email = last_name
        self.password = last_name
        self.address = last_name
        self.city = last_name
        self.country = last_name
    }
}
