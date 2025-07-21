//
//  MapViewController.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import UIKit
import MapKit
import Combine

final class MapViewController: UIViewController {
    
    private let mapView = MKMapView()
    private var viewModel: MapViewModel!
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        view.backgroundColor = .systemBackground
        setupMapView()
    }
    
    func configure(with scanViewModel: ScanViewModel) {
        self.viewModel = MapViewModel(scanViewModel: scanViewModel)
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func updateMapAnnotations(_ records: [PlateScanRecord]) {
        mapView.removeAnnotations(mapView.annotations)
        
        records.forEach { record in
            let annotation = MKPointAnnotation()
            annotation.coordinate = record.location
            annotation.title = record.plate
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            annotation.subtitle = formatter.string(from: record.timestamp)
            mapView.addAnnotation(annotation)
        }
        
        if let last = records.last {
            let region = MKCoordinateRegion(center: last.location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
        }
    }
}
