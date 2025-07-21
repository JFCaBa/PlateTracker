//
//  PlateScanRecord.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation
import CoreLocation

struct PlateScanRecord {
    let plate: String
    let location: CLLocationCoordinate2D
    let timestamp: Date
}
