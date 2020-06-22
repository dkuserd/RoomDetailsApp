//
//  Availability.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 19/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

struct TimeToStringStruct {
    let eight = "08:00"
//    case eightThirty = "08:30"
//    case nine = "09:00"
//    case nineThirty = "09:30"
//    case ten = "10:00"
//    case tenThirty = "10:30"
//    case eleven = "11:00"
//    case elevenThirty = "11:30"
//    case twelve = "12:00"
//    case twelveThirty = "12:30"
//    case thirteen = "13:00"
//    case thirteenThirty = "13:30"
//    case fourteen = "14:00"
//    case fourteenThirty = "14:30"
//    case fifteen = "15:00"
//    case fifteenThirty = "15:30"
//    case sixteen = "16:00"
//    case sixteenThirty = "16:30"
//    case seventeen = "17:00"
//    case seventeenThirty = "17:30"
//    case eighteen = "18:00"
//    case eighteenThirty = "18:30"
//    case nineteen = "19:00"
//    case nineteenThirty = "19:30"

}

import Foundation
struct Availability: Codable {
    
    let timeToStringStruct = TimeToStringStruct()
    
    let eight: String?
    let eightThirty: String?
    let nine: String?
    let nineThirty: String?
    let ten: String?
    let tenThirty: String?
    let eleven: String?
    let elevenThirty: String?
    let twelve: String?
    let twelveThirty: String?
    let thirteen: String?
    let thirteenThirty: String?
    let fourteen: String?
    let fourteenThirty: String?
    let fifteen: String?
    let fifteenThirty: String?
    let sixteen: String?
    let sixteenThirty: String?
    let seventeen: String?
    let seventeenThirty: String?
    let eighteen: String?
    let eighteenThirty: String?
    let nineteen: String?
    let nineteenThirty: String?

    enum CodingKeys: String, CodingKey {

        case eight = "08:00"
        case eightThirty = "08:30"
        case nine = "09:00"
        case nineThirty = "09:30"
        case ten = "10:00"
        case tenThirty = "10:30"
        case eleven = "11:00"
        case elevenThirty = "11:30"
        case twelve = "12:00"
        case twelveThirty = "12:30"
        case thirteen = "13:00"
        case thirteenThirty = "13:30"
        case fourteen = "14:00"
        case fourteenThirty = "14:30"
        case fifteen = "15:00"
        case fifteenThirty = "15:30"
        case sixteen = "16:00"
        case sixteenThirty = "16:30"
        case seventeen = "17:00"
        case seventeenThirty = "17:30"
        case eighteen = "18:00"
        case eighteenThirty = "18:30"
        case nineteen = "19:00"
        case nineteenThirty = "19:30"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        eight = try values.decodeIfPresent(String.self, forKey: .eight)
        eightThirty = try values.decodeIfPresent(String.self, forKey: .eightThirty)
        nine = try values.decodeIfPresent(String.self, forKey: .nine)
        nineThirty = try values.decodeIfPresent(String.self, forKey: .nineThirty)
        ten = try values.decodeIfPresent(String.self, forKey: .ten)
        tenThirty = try values.decodeIfPresent(String.self, forKey: .tenThirty)
        eleven = try values.decodeIfPresent(String.self, forKey: .eleven)
        elevenThirty = try values.decodeIfPresent(String.self, forKey: .elevenThirty)
        twelve = try values.decodeIfPresent(String.self, forKey: .twelve)
        twelveThirty = try values.decodeIfPresent(String.self, forKey: .twelveThirty)
        thirteen = try values.decodeIfPresent(String.self, forKey: .thirteen)
        thirteenThirty = try values.decodeIfPresent(String.self, forKey: .thirteenThirty)
        fourteen = try values.decodeIfPresent(String.self, forKey: .fourteen)
        fourteenThirty = try values.decodeIfPresent(String.self, forKey: .fourteenThirty)
        fifteen = try values.decodeIfPresent(String.self, forKey: .fifteen)
        fifteenThirty = try values.decodeIfPresent(String.self, forKey: .fifteenThirty)
        sixteen = try values.decodeIfPresent(String.self, forKey: .sixteen)
        sixteenThirty = try values.decodeIfPresent(String.self, forKey: .sixteenThirty)
        seventeen = try values.decodeIfPresent(String.self, forKey: .seventeen)
        seventeenThirty = try values.decodeIfPresent(String.self, forKey: .seventeenThirty)
        eighteen = try values.decodeIfPresent(String.self, forKey: .eighteen)
        eighteenThirty = try values.decodeIfPresent(String.self, forKey: .eighteenThirty)
        nineteen = try values.decodeIfPresent(String.self, forKey: .nineteen)
        nineteenThirty = try values.decodeIfPresent(String.self, forKey: .nineteenThirty)
    }

}
