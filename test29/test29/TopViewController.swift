//
//  TopViewController.swift
//  test29
//
//  Created by 石塚大 on 2019/06/27.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

// MARK: - Property
class TopViewController: BaseViewController {
    @IBOutlet weak var topMainView: TopMainView!
    
}

// MARK: - Life cycle
extension TopViewController {
    override func loadView() {
        super.loadView()
        topMainView.delegate = self
    }
    
}

// MARK: - Protocol
extension TopViewController: TopMainViewDelegate{
    func touchedBtn() {
        let vc: SecondViewController = SecondViewController()
        transitionViewController(from: self, to: vc)
    }
    
    
}

// MARK: - method
extension TopViewController {
    
}

