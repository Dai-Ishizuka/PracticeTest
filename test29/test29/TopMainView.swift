//
//  TopMainView.swift
//  test29
//
//  Created by 石塚大 on 2019/06/27.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

protocol TopMainViewDelegate: NSObjectProtocol{
    func touchedBtn()
    
}

extension TopMainViewDelegate {
    
}
// MARK: - Property
class TopMainView: BaseView {
    weak var delegate: TopMainViewDelegate? = nil
  
    @IBOutlet weak var imageView: UIImageView!
    
    let cat = UIImage(named: "cat")
    
    @IBAction func Btn(_ sender: Any) {
        delegate?.touchedBtn()
    }
    
    
}

// MARK: - Life cycle
extension TopMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.image = cat
    }

    
}

// MARK: - Protocol
extension TopMainView {
    
}

// MARK: - method
extension TopMainView {
    
}


