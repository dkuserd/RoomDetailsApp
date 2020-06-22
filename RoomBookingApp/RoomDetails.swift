//
//  RoomDetails.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 19/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
struct RoomDetails : Codable {
    let name : String?
    let capacity : String?
    let level : String?
    let availability : Availability?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case capacity = "capacity"
        case level = "level"
        case availability = "availability"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        capacity = try values.decodeIfPresent(String.self, forKey: .capacity)
        level = try values.decodeIfPresent(String.self, forKey: .level)
        availability = try values.decodeIfPresent(Availability.self, forKey: .availability)
    }

}

