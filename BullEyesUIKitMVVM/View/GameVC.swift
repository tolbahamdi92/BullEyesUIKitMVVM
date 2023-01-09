//
//  GameVC.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 11/05/1444 AH.
//

import UIKit

class GameVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundNumberLabel: UILabel!
    @IBOutlet weak var scoreNumberLabel: UILabel!
    
    //MARK: Properties
    private lazy var vm: GameVM = {
        return GameVM()
    }()
    
    //MARK: LifeCycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        initVM()
    }
    
    //MARK: IBAction
    @IBAction func hitBtnTapped(_ sender: UIButton) {
        vm.calculateScore()
        vm.showAlert()
    }
    
    @IBAction func startOverBtnTapped(_ sender: UIButton) {
        vm.startNewGame()
    }
    
    @IBAction func moveSlider(_ sender: UISlider) {
        vm.actualValue = lroundf(sender.value)
    }
}

//MARK: Private Methods
extension GameVC {
    private func initVM() {
        vm.updateTargetValue = { [weak self] () in
            DispatchQueue.main.async {
                if let targetValue = self?.vm.targetValue {
                    self?.targetLabel.text = String(targetValue)
                }
            }
        }
        
        vm.updateScoreValue = { [weak self] () in
            DispatchQueue.main.async {
                if let scoreValue = self?.vm.scoreValue {
                    self?.scoreNumberLabel.text = String(scoreValue)
                }
            }
        }
        
        vm.updateRoundValue = { [weak self] () in
            DispatchQueue.main.async {
                if let roundValue = self?.vm.roundValue {
                    self?.roundNumberLabel.text = String(roundValue)
                }
            }
        }
        
        vm.updateSliderValue = { [weak self] () in
            DispatchQueue.main.async {
                if let sliderValue = self?.vm.actualValue {
                    self?.slider.value = Float(sliderValue)
                }
            }
        }
        
        vm.showAlertClosure = { [weak self] (title,message) in
            DispatchQueue.main.async {
                self?.showAlert(title, message)
            }
        }
        
        vm.getData()
    }
    
    private func setupSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0,
                                left: 14,
                                bottom: 0,
                                right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
            withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
            withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            self.vm.startNewRound()}
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
