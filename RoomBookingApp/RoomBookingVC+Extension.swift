//
//  RoomBookingVC+Extension.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 22/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation
import UIKit

extension RoomBookingVC {
    /// To set hotel availablity label based on response
    /// - Parameters:
    ///   - cell: table cell
    ///   - indexPath: table indexPath
    ///   - allRoomsDetailsUnwrapped: allRoomsDetailsUnwrapped
    func hotelAvailablityLabelSetter(cell: RoomBookingTVCell, indexPath: IndexPath, allRoomsDetailsUnwrapped: [RoomDetailsSingle]) {
        var availabilityStatusCode: String? = ""
        switch hourMin {
        case "08:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.eight
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "08:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.eightThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "09:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.nine
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
            
        case "09:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.nineThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "10:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.ten
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "10:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.tenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "11:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.eleven
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "11:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.elevenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "12:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.twelve
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "12:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.twelveThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "13:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.thirteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "13:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.twelveThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "14:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.fourteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "14:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.fourteenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "15:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.fifteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "15:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.fifteenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "16:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.sixteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "16:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.sixteenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "17:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.seventeen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "17:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.seventeenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "18:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.eighteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "18:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.eighteenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "19:00":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.nineteen
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        case "19:30":
            availabilityStatusCode = allRoomsDetailsUnwrapped[indexPath.row].availability?.nineteenThirty
            if let availStatusCode = availabilityStatusCode {
                availabilityLabelCustomization(availabilityStatusCode: availStatusCode, cell: cell)
            }
        default:
            cell.hotelAvailabilityOutlet.text = RoomBookingConstants.roomNotAvailable
        }
    }
    
    /// To customise based on availability status code
    /// - Parameters:
    ///   - availabilityStatusCode: availabilityStatusCode, 1-Available, 0-Not Available
    ///   - cell: cell
    func availabilityLabelCustomization(availabilityStatusCode: String, cell: RoomBookingTVCell) {
        if availabilityStatusCode == RoomBookingConstants.availabilityStatusCode {
            cell.hotelAvailabilityOutlet.text = RoomBookingConstants.roomAvailable
            cell.hotelAvailabilityOutlet.textColor = UIColor(red: 118/255, green: 175/255, blue: 0, alpha: 1.0)
        } else {
            cell.hotelAvailabilityOutlet.text = RoomBookingConstants.roomNotAvailable
            cell.hotelAvailabilityOutlet.textColor = UIColor.lightGray
            
        }
    }
}
