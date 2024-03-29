//
//  SecondViewController.swift
//  test29
//
//  Created by 石塚大 on 2019/06/27.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

// MARK: - Property
class SecondViewController: BaseViewController {
   
    @IBOutlet weak var secondMainView: SecondMainView!
    
    
}

// MARK: - Life cycle
extension SecondViewController {
    override func loadView() {
        super.loadView()
        secondMainView.delegate = self
    }
}

// MARK: - Protocol
extension SecondViewController:SecondMainViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row % 2 {
        case 0:
            navigationController?.popViewController(animated: true)
        default:
            let vc: ThirdViewController = ThirdViewController()
            transitionViewController(from: self, to: vc)
        }
        
    }
    
    
}

// MARK: - method
extension SecondViewController {
    
}

