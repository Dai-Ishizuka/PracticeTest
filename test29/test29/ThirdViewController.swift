//
//  ThirdViewController.swift
//  test29
//
//  Created by 石塚大 on 2019/06/28.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

// MARK: - Property
class ThirdViewController: BaseViewController {
    
    @IBOutlet weak var ThirdMainView: ThirdMainView!
}

// MARK: - Life cycle
extension ThirdViewController {
    override func loadView() {
        super.loadView()
        UserModel.reads { (aaa) in    //aaaにreadsを入れていく
            self.ThirdMainView.userModels = aaa
            self.ThirdMainView.collectionView.reloadData()  //既存の関数　これを入れることによってセルに表示される
        }
    }
    
}

// MARK: - Protocol
extension ThirdViewController {
    
}

// MARK: - method
extension ThirdViewController {
    
}


