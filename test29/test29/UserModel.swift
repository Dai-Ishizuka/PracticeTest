//
//  UserModel.swift
//  test29
//
//  Created by 石塚大 on 2019/07/01.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit
import PGFramework

// MARK: - Property
class UserModel {
    // Path
    fileprivate static let PATH: String = "users"
    // parameters
    var id: Int?
    var name: String?
    var description:String?
}
struct UserModelRequest {
    // parameters
    var id: Int?
    var name: String?
    var description:String?
}
// MARK: - Parse
extension UserModel {
    static func parse(data: [String: Any]) -> UserModel {
        let model = UserModel()
        model.id = data["id"] as? Int
        model.name = data["name"] as? String
        model.description = data["description"] as? String
        return model
    }
    static func setParameter(request: UserModelRequest) -> [String: Any] {
        var parameter: [String: Any] = [:]
        if let id = request.id {     //nilじゃなかったら
            parameter["id"] = id    //配列に格納する
        }
        if let name = request.name {
            parameter["name"] = name
        }
        if let description = request.description {
            parameter["description"] = description
        }
        return parameter
    }
}
// MARK: - Reads
extension UserModel {
    static func reads(success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher2()
        fetcher.request(path: PATH + "?format=json",
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = ListModel<UserModel>()
                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }
                            if let response = response,
                                let _ = response["next"] {
                                listModel.loadMore = true
                            } else {
                                listModel.loadMore = false
                            }
                            if let response = response,
                                let results = response["results"] as? [[String: AnyObject]] {
                                let _ = results.map { data in
                                    let model: UserModel = parse(data: data)
                                    listModel.insert(model)
                                }
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}
// MARK: - ReadMore
extension UserModel {
    static func readMore(listModel: ListModel<UserModel>, success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher2()
        fetcher.request(path: PATH + "?format=json" + "&offset=" + String(describing: listModel.contents.count),
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = listModel
                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }
                            if let response = response,
                                let _ = response["next"] {
                                listModel.loadMore = true
                            } else {
                                listModel.loadMore = false
                            }
                            if let response = response,
                                let results = response["results"] as? [[String: AnyObject]] {
                                let _ = results.map { data in
                                    let model: UserModel = parse(data: data)
                                    listModel.insert(model)
                                }
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}
// MARK: - ReadAt
extension UserModel {
    static func readAt(request: UserModelRequest, success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher2()
        guard let id = request.id else {
            return
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .get,
                        parameters: nil,
                        success: { response in
                            var listModel = ListModel<UserModel>()
                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }
                            if let response = response,
                                let _ = response["next"] {
                                listModel.loadMore = true
                            } else {
                                listModel.loadMore = false
                            }
                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in
        })
    }
}
// MARK: - Create
extension UserModel {
    static func create(request: UserModelRequest,
                       success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher2()
        var param = setParameter(request: request)
        if let _ = param["id"] {
            param.remove(at: param.index(forKey: "id")!)
        }
        
        fetcher.request(path: PATH + "?format=json",
                        method: .post,
                        parameters: param,
                        success: { response in
                            var listModel = ListModel<UserModel>()
                            
                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }
                            
                            if let response = response,
                                let _ = response["next"] {
                                listModel.loadMore = true
                            } else {
                                listModel.loadMore = false
                            }
                            
                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in
                            
        })
        
    }
}


// MARK: - Update
extension UserModel {
    static func update(request: UserModelRequest,
                       success:@escaping (ListModel<UserModel>) -> Void) {
        let fetcher = Fetcher2()
        guard let id = request.id else {
            return
        }
        var param = setParameter(request: request)
        if let _ = param["id"] {
            param.remove(at: param.index(forKey: "id")!)
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .put,
                        parameters: param,
                        success: { response in
                            var listModel = ListModel<UserModel>()
                            
                            if let response = response,
                                let count = response["count"] {
                                listModel.max_count = count as! Int
                            }
                            
                            if let response = response,
                                let _ = response["next"] {
                                listModel.loadMore = true
                            } else {
                                listModel.loadMore = false
                            }
                            
                            if let data = response {
                                let model: UserModel = parse(data: data)
                                listModel.insert(model)
                            }
                            success(listModel)
        },
                        failed: { error in
        })
        
    }
}

// MARK: - Delete
extension UserModel {
    static func delete(request: UserModelRequest, success:@escaping () -> Void) {
        let fetcher = Fetcher2()
        guard let id = request.id else {
            return
        }
        fetcher.request(path: PATH + String(describing: id) + "/?format=json",
                        method: .delete,
                        parameters: nil,
                        success: { response in
                            success()
        },
                        failed: { error in
        })
    }
}

