//
//  Constants.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 01/07/1444 AH.
//

import Foundation

enum ScoreResult {
    case score(Int)
    
    init(score: Int) {
        switch score {
        default :
            self = .score(score)
        }
    }
    
    var value: String {
        switch self {
        case .score(let score):
            return "You scored \(score) points !"
        }
    }
}

// MARK: Images
struct Images {
    static let sliderThumbNormal: String = "SliderThumb-Normal"
    static let sliderThumbHighlighted: String = "SliderThumb-Highlighted"
    static let sliderTrackLeft: String = "SliderTrackLeft"
    static let sliderTrackRight: String = "SliderTrackRight"
}

// MARK: UserDefaultsKeys
struct UserDefaultsKeys {
    static let data: String = "data"
}

// MARK: UserDefaultsError
struct UserDefaultsError {
    static let decode: String = "unable to decode data"
    static let encode: String = "unable to encode data"
}

// MARK: Alerts
struct Alerts {
    static let titlePerfect: String = "Perfect!"
    static let titleAlmost: String = "You almost had it!"
    static let titlePretty: String = "Pretty good!"
    static let titleFail: String = "Not even close..."
}

// MARK: Buttons
struct Buttons {
    static let alertOk: String = "OK"
}

// MARK: URLs
struct URLs {
    static let urlResource: String = "BullsEye"
    static let urlExtension: String = "html"
}
