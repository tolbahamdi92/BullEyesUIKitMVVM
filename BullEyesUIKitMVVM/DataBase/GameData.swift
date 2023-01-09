//
//  GameData.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 16/06/1444 AH.
//

import Foundation

struct GameData {
    private(set) static var gameObject: Game? {
        get {
            return UserDefaults.standard.getObject(dataType: Game.self, key: "data")
        }
        set {
            UserDefaults.standard.setObject(newValue, for: "data")
        }
    }
    
    static func saveData(score: Int, round: Int) {
        gameObject = Game(score: score, round: round)
    }
}
