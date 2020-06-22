//
//  RoomBookingProtocol.swift
//  RoomBookingApp
//
//  Created by Dadha Kumar on 20/6/20.
//  Copyright © 2020 Dadha Kumar. All rights reserved.
//

import Foundation

struct ServiceApiKeys {
    static var serviceUrl: String = "https://gist.githubusercontent.com/yuhong90/7ff8d4ebad6f759fcc10cc6abdda85cf/raw/463627e7d2c7ac31070ef409d29ed3439f7406f6/room-availability.json"
}

struct RoomDetailsSingle {
    var hotelName: String = ""
    var level: String = ""
    var capacity: String = ""
    var availability: Availability?
    var capacityInt: Int = -1
}

struct RoomsDetailsViewModel {
    var allRoomsDetails: [RoomDetailsSingle]
    var isError: Bool
    var message: String?
}

struct RoomBookingConstants {
    static let numberOfSections: Int = 1
    static let numberOfRowsInSection: Int = 1
    static let roomBookingTVCellIdentifier: String = "roomBookingTVCell"
    static let roomPassenger: String = " Pax"
    static let availabilityStatusCode: String = "1"
    static let roomAvailable: String = "Available"
    static let roomNotAvailable: String = "Not Available"
    static let radioButtonUnchecked: String = "radio_Unchecked"
    static let radioButtonChecked: String = "radio_Checked"
    static let locationSort: String = "location"
    static let capacitySort: String = "capacity"
    static let minuteInterval: Int = 30
}

struct RoomDetailsWithError {
    var roomDetails: [RoomDetails]?
    var isError: Bool
    var message: String?
}

protocol RoomBookingStoreProtocol {
    
    func fetchRoomsDetailsList(serviceUrl: String,
                               success: @escaping(responseHandler),
                               failure: @escaping(responseHandler))
}

protocol RoomBookingInteractorProtocol {
    
    var moduleInteractor: RoomBookingStoreProtocol { get set }
    func fetchRoomsDetailsList(serviceUrl: String)
}

protocol RoomBookingPresenterProtocol {
    
    func presentFetchedRoomsDetailsList(roomsDetails: RoomDetailsWithError)
}

protocol RoomBookingViewProtocol: class {
    func errorFetchedRoomsDetails(roomsDetailsViewModel:
        RoomsDetailsViewModel)
    func successFetchedRoomsDetails(roomsDetailsViewModel: RoomsDetailsViewModel)
}

protocol RoomBookingSortProtocol: class {
    func sortBasedOnSelection(sortBased: String)
}
