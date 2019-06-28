//
//  MainTableViewCell.swift
//  test29
//
//  Created by 石塚大 on 2019/06/27.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

protocol MainTableViewCellDelegate: NSObjectProtocol{
    
}

extension MainTableViewCellDelegate {
    
}
// MARK: - Property
class MainTableViewCell: BaseTableViewCell {
    weak var delegate: MainTableViewCellDelegate? = nil
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
}

// MARK: - Life cycle
extension MainTableViewCell {
    
}

// MARK: - Protocol
extension MainTableViewCell {
    
}

// MARK: - method
extension MainTableViewCell {
    
}


