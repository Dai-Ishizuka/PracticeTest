//
//  MainCollectionViewCell.swift
//  test29
//
//  Created by 石塚大 on 2019/07/01.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

protocol MainCollectionViewCellDelegate: NSObjectProtocol{
    
}

extension MainCollectionViewCellDelegate {
    
}
// MARK: - Property
class MainCollectionViewCell: BaseCollectionViewCell {
    weak var delegate: MainCollectionViewCellDelegate? = nil
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

// MARK: - Life cycle
extension MainCollectionViewCell {
    
}

// MARK: - Protocol
extension MainCollectionViewCell {
    
}

// MARK: - method
extension MainCollectionViewCell {
    func updataCell(userModel: UserModel) {
        nameLabel.text = userModel.name
        descriptionLabel.text = userModel.description
    }
}


