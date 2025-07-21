//
//  ScanViewModel.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation
import Combine
import CoreLocation

final class ScanViewModel {
    
    @Published private(set) var scanRecords: [PlateScanRecord] = []
    
    private let locationService = LocationService()
    private var currentLocation: CLLocationCoordinate2D?
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        locationService.currentLocationPublisher
            .sink { [weak self] location in
                self?.currentLocation = location
            }
            .store(in: &subscriptions)
    }
    
    func processRecognizedText(_ text: String) {
        let plate = text.replacingOccurrences(of: " ", with: "").uppercased()
        
        let formats: [PlateCountry] = [.uk, .spain, .russia]
        
        guard formats.contains(where: { PlateValidator.isValid(plate: plate, for: $0) }),
              scanRecords.contains(where: { $0.plate == plate }) == false,
              let location = currentLocation else { return }
        
        let record = PlateScanRecord(plate: plate, location: location, timestamp: Date())
        scanRecords.append(record)
        
        fetchInfo(for: plate)
    }

    private func fetchInfo(for plate: String) {
        MockNetworkService.shared.fetchPlateInfo(for: plate)
            .sink { info in
                print("Mocked API: \(info.registration) | \(info.make ?? "") \(info.model ?? "") \(info.year ?? "") | Owner: \(info.owner ?? "")")
            }
            .store(in: &subscriptions)
    }
    
//    func processRecognizedText(_ text: String) {
//        let plate = text.replacingOccurrences(of: " ", with: "").uppercased()
//        guard scanRecords.contains(where: { $0.plate == plate }) == false, plate.count >= 5 else { return }
//        guard let location = currentLocation else { return }
//        let record = PlateScanRecord(plate: plate, location: location, timestamp: Date())
//        scanRecords.append(record)
//    }
//    
//    func fetchInfo(for plate: String) {
//        let urlString = "https://yourapi.com/plates/\(plate)" 
//        NetworkService.shared.fetch(urlString: urlString)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Network error: \(error)")
//                case .finished:
//                    break
//                }
//            }, receiveValue: { (response: PlateInfoResponse) in
//                print("Fetched info for \(plate): \(response)")
//                // Here you could store extra info with your PlateScanRecord
//            })
//            .store(in: &subscriptions)
//    }
}
