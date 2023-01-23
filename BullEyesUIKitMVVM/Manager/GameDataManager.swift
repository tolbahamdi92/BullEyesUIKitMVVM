//
//  GameDataManager.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 16/06/1444 AH.
//

import Foundation

struct GameDataManager {
    private(set) static var gameObject: Game? {
        get {
            return UserDefaults.standard.getObject(dataType: Game.self, key: UserDefaultsKeys.data)
        }
        set {
            UserDefaults.standard.setObject(newValue, for: UserDefaultsKeys.data)
        }
    }
    
    static func saveData(score: Int, round: Int) {
        gameObject = Game(score: score, round: round)
    }
}
