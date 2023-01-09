//
//  AboutVC.swift
//  BullEyesUIKitMVVM
//
//  Created by Tolba on 17/05/1444 AH.
//

import UIKit
import WebKit

class AboutVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: LifeCycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    //MARK: IBAction
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Private Methods
extension AboutVC {
    private func setupWebView() {
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
