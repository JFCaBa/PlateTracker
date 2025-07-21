
# 🚗 License Plate Tracker App

An iOS application built with **Swift**, **MVVM**, and **Combine**, designed to scan vehicle registration plates using the camera (OCR), store scanned data with GPS location, and visualize results via a tab-based interface including a map.

---

## 📱 Features

- 🚘 **Scan Vehicle Plates**  
  Live camera feed with OCR (Apple Vision) to detect license plates.

- 🌐 **Mock Network Integration**  
  Simulates fetching additional vehicle details (make, model, owner) via a mocked API.

- 🗺 **Location Tracking**  
  Captures and stores GPS location with each scan.

- 🗂 **Results History**  
  Displays all recognized plates in a searchable list.

- 🗺 **Map View**  
  Visualizes scanned locations on a map with annotations.

---

## 🛠 Technologies

| Layer        | Tech          |
|--------------|---------------|
| UI           | UIKit (No Storyboards) |
| Architecture | MVVM           |
| Camera / OCR | AVFoundation + Vision |
| Networking   | Combine + URLSession (Mocked) |
| Map          | MapKit         |
| Location     | CoreLocation   |

---

## 📂 Project Structure

```
├── Model
│   └── PlateScanRecord.swift
├── Services
│   ├── LocationService.swift
│   ├── NetworkService.swift
│   └── MockNetworkService.swift
├── ViewModel
│   ├── ScanViewModel.swift
│   ├── ResultsViewModel.swift
│   └── MapViewModel.swift
├── ViewController
│   ├── MainTabBarController.swift
│   ├── ScanViewController.swift
│   ├── ResultsViewController.swift
│   └── MapViewController.swift
└── Resources
    ├── AppIcon (1024x1024)
    └── LaunchScreen Image
```

---

## 📷 Screenshots  
*(Optional - Insert screenshots of your app once available)*

---

## 🔑 Permissions Required (Info.plist)

```xml
NSCameraUsageDescription: This app uses the camera to scan vehicle registration plates.
NSLocationWhenInUseUsageDescription: This app uses your location to record where plates were scanned.
```

---

## 🚀 Getting Started

1. Clone this repo.
2. Open the `.xcodeproj`.
3. Run on a real device (Camera + Location permissions required).

---

## 🧪 Future Improvements
- Real API Integration.
- CoreData / persistence layer.
- Push notifications (optional).
- Dark mode refinements.

---

## 📄 License
MIT License — free to use and modify.
