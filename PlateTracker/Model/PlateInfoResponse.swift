//
//  PlateInfoResponse.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation

struct PlateInfoResponse: Decodable {
    let registration: String
    let make: String?
    let model: String?
    let year: String?
    let owner: String?
}
