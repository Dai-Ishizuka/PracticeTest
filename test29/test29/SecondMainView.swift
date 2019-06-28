//
//  SecondMainView.swift
//  test29
//
//  Created by 石塚大 on 2019/06/27.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

protocol SecondMainViewDelegate: NSObjectProtocol{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
}

extension SecondMainViewDelegate {
    
}
// MARK: - Property
class SecondMainView: BaseView {
    weak var delegate: SecondMainViewDelegate? = nil
   
    @IBOutlet weak var tableView: UITableView!
    let sections: [String] = ["セクション１","セクション２","セクション３"]
    let seasons: [String] = ["春","夏","秋","冬"]
    
}

// MARK: - Life cycle
extension SecondMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        loadTableViewCellFromXib(tableView: tableView, cellName: "MainTableViewCell")  //忘れやすい！！
        loadTableViewCellFromXib(tableView: tableView, cellName: "SubTableViewCell")
    }
    
}

// MARK: - Protocol
extension SecondMainView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view1: UIView = UIView()
//        view1.backgroundColor = UIColor.cyan
//        return view1
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        guard let cell1: SubTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubTableViewCell", for: indexPath) as? SubTableViewCell else {
            return UITableViewCell()
        }
        
        cell.leftLabel.text = indexPath.row.description
        cell.rightLabel.text = seasons[indexPath.row]
        
        switch indexPath.row {
        case 0,2:
            return cell
        default:
            return cell1
        }
        
    }
}

extension SecondMainView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tableView(tableView, didSelectRowAt: indexPath)
    }
}


// MARK: - method
extension SecondMainView {
    
}


