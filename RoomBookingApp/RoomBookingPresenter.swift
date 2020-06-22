//
//  RoomBookingPresenter.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 21/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

class RoomBookingPresenter: RoomBookingPresenterProtocol {
    
    weak var roomBookingVC: RoomBookingViewProtocol?
    
    /// To present roomsDetails
    /// - Parameter roomsDetails: roomsDetails
    func presentFetchedRoomsDetailsList(roomsDetails: RoomDetailsWithError) {
        var allRoomsDetails = [RoomDetailsSingle]()
        if let roomDetailsUnwrapped = roomsDetails.roomDetails {
            for json in roomDetailsUnwrapped {
                var singleRoomDetails = RoomDetailsSingle()
                singleRoomDetails.hotelName = json.name ?? ""
                singleRoomDetails.level = json.level ?? ""
                singleRoomDetails.capacity = json.capacity ?? ""
                singleRoomDetails.availability = json.availability
                if let capacityIn = json.capacity {
                    singleRoomDetails.capacityInt = Int(capacityIn) ?? 0
                }
                
                allRoomsDetails.append(singleRoomDetails)
            }
            allRoomsDetails.sort { $0.level < $1.level }
        }

        let roomsDetailsViewModel = RoomsDetailsViewModel(allRoomsDetails: allRoomsDetails, isError: roomsDetails.isError, message: roomsDetails.message)
        if roomsDetailsViewModel.isError {
            roomBookingVC?.errorFetchedRoomsDetails(roomsDetailsViewModel: roomsDetailsViewModel)
        } else {
            roomBookingVC?.successFetchedRoomsDetails(roomsDetailsViewModel: roomsDetailsViewModel)
        }
    }
}
