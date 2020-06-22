//
//  RoomBookingStore.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

typealias responseHandler = (_ response: RoomDetailsWithError) -> ()

class RoomBookingStore: RoomBookingStoreProtocol {
    /// To fetchRoomsDetails
    /// - Parameters:
    ///   - serviceUrl: serviceUrl
    ///   - success: success
    ///   - failure: failure
    func fetchRoomsDetailsList(serviceUrl: String,
                               success: @escaping(responseHandler),
                               failure: @escaping(responseHandler)) {
        let apiManager = ApiManager()
        apiManager.fetchRoomsDetailsList(serviceUrl: serviceUrl) { (roomDetails, error) in
            if roomDetails != nil, let roomDetailsUnwrapped = roomDetails {
                success(RoomDetailsWithError(roomDetails: roomDetailsUnwrapped,
                                             isError: false,
                                             message: error?.localizedDescription))
            } else {
                failure(RoomDetailsWithError(roomDetails: nil,
                                             isError: true,
                                             message: error?.localizedDescription))
            }
        }
    }
}
