//
//  ResultsViewModel.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation
import Combine
import CoreLocation

final class ResultsViewModel {
    
    @Published private(set) var records: [PlateScanRecord] = []
    private var subscriptions = Set<AnyCancellable>()
    
    init(scanViewModel: ScanViewModel) {
        scanViewModel.$scanRecords
            .receive(on: RunLoop.main)
            .assign(to: \.records, on: self)
            .store(in: &subscriptions)
    }
}
