//
//  MockNetworkService.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation
import Combine

final class MockNetworkService {
    
    static let shared = MockNetworkService()
    
    private init() {}
    
    func fetchPlateInfo(for plate: String) -> AnyPublisher<PlateInfoResponse, Never> {
        // Fake data to return
        let mockData = PlateInfoResponse(
            registration: plate,
            make: "Toyota",
            model: "Corolla",
            year: "2015",
            owner: "John Doe"
        )
        
        // Simulate network delay
        return Just(mockData)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
