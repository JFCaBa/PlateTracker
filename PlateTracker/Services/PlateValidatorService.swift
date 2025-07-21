//
//  PlateValidatorService.swift
//  PlateTracker
//
//  Created by Jose on 21/07/2025.
//

import Foundation

enum PlateCountry {
    case uk
    case spain
    case russia
}

final class PlateValidator {
    
    static func isValid(plate: String, for country: PlateCountry) -> Bool {
        let pattern: String
        
        switch country {
        case .uk:
            pattern = #"^[A-Z]{2}[0-9]{2}\s?[A-Z]{3}$"#
        case .spain:
            pattern = #"^[0-9]{4}\s?[A-Z]{3}$"#
        case .russia:
            pattern = #"^[А-ЯA-Z]{1}[0-9]{3}[А-ЯA-Z]{2}\s?[0-9]{2,3}$"#
        }
        
        return plate.range(of: pattern, options: .regularExpression) != nil
    }
}
