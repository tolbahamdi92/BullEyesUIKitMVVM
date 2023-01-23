//
//  GameVM.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 19/05/1444 AH.
//

import Foundation

enum TitleAlert {
    case title(_ differenceTargetAndActualValue: Int)
    
    var value: String {
        switch self {
        case .title(let difference):
            switch difference {
            case 0:
                return Alerts.titlePerfect
            case 1..<5:
                return Alerts.titleAlmost
            case 5..<10:
                return Alerts.titlePretty
            default:
                return Alerts.titleFail
            }
        }
    }
}

class GameVM {
    
    // MARK: Properties
    var updateTargetValue: (()->())?
    var updateScoreValue: (()->())?
    var updateRoundValue: (()->())?
    var updateSliderValue: (()->())?
    var showAlertClosure: ((String, String)->())?
    
    var targetValue: Int = Int.random(in: 1...100) {
        didSet {
            self.updateTargetValue?()
        }
    }
    
    var scoreValue: Int = 0 {
        didSet {
            self.updateScoreValue?()
        }
    }
    
    var roundValue: Int = 0 {
        didSet {
            self.updateRoundValue?()
        }
    }
    
    var actualValue: Int = 50 {
        didSet {
            self.updateSliderValue?()
        }
    }
}

// MARK: Methods
extension GameVM {
    func getData() {
        if let data = GameDataManager.gameObject {
            scoreValue = data.score
            roundValue = data.round
            targetValue = Int.random(in: 1...100)
            actualValue = 50
        } else {
            startNewGame()
        }
    }
    
    func startNewGame() {
        roundValue = 0
        scoreValue = 0
        startNewRound()
    }
    
    func startNewRound() {
        roundValue += 1
        targetValue = Int.random(in: 1...100)
        actualValue = 50
        setData()
    }
    
    func calculateScore() {
        let difference: Int = calculateDifferences()
        if difference == 0 {
            scoreValue  += 200
        } else if difference == 1 {
            scoreValue  += 150
        } else {
            scoreValue  += 100 - difference
        }
        setData()
    }
    
    private func setData() {
        GameDataManager.saveData(score: scoreValue, round: roundValue)
    }
    
    private func calculateDifferences() -> Int {
        return abs(targetValue - actualValue)
    }
    
    func showAlert() {
        let title = TitleAlert.title(calculateDifferences()).value
        let message: String = ScoreResult(score: calculatePoints()).value
        self.showAlertClosure?(title,message)
    }
    
    private func calculatePoints() -> Int {
        return 100 - calculateDifferences()
    }
    
    
}
