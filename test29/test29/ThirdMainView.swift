//
//  ThirdMainView.swift
//  test29
//
//  Created by 石塚大 on 2019/07/01.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

protocol ThirdMainViewDelegate: NSObjectProtocol{
    
}

extension ThirdMainViewDelegate {
    
}
// MARK: - Property
class ThirdMainView: BaseView {
    weak var delegate: ThirdMainViewDelegate? = nil
    @IBOutlet weak var collectionView: UICollectionView!
    var userModels: ListModel<UserModel> = ListModel<UserModel>()    //分身作る　userModelに絞ってる　　ListModel?
    
}

// MARK: - Life cycle
extension ThirdMainView {
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self       // 最低限必要
        loadCollectionViewCellFromXib(collectionView: collectionView, cellName: "MainCollectionViewCell")
        //忘れやすい！！セルのレイアウト
        //colomnCountは縦列を表している
        setCollectionViewLayout(collectionView: collectionView, columnCount:1, heithRatio: 1
            , direction: UICollectionView.ScrollDirection.vertical)
    }
    
}

// MARK: - Protocol
extension ThirdMainView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModels.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updataCell(userModel: userModels.contents[indexPath.row]) // 何故使わない？
        //cell.nameLabel.text = userModels.contents[indexPath.row].name
        //cell.descriptionLabel.text = userModels.contents[indexPath.row].description
        return cell
    }
    
    
}

// MARK: - method
extension ThirdMainView {
    func updata() {  //いらないかも
        collectionView.reloadData()
    }
    
}


