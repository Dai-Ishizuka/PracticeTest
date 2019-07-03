//
//  Fetcher2.swift
//  test29
//
//  Created by 石塚大 on 2019/07/01.
//  Copyright © 2019 石塚大. All rights reserved.
//

import UIKit

import Alamofire


class ApiManager {
    static let sharedInstance: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10.0
        return SessionManager(configuration: configuration)
    }()
}

class Fetcher2: NSObject {
    // MARK: - Property
    var url: String!
    func request(path: String?,
                 method: HTTPMethod,
                 parameters: [String: Any]?,
                 success: @escaping ([String: Any]?) -> Void,
                 failed: @escaping (Error) -> Void) {
        let manager = ApiManager.sharedInstance
        setHost()
        setPath(path: path)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"]
        //        if var token = UserDataManager.loadToken() {
        //            headers["Authorization"] = token
        //        }
        manager
            .request(self.url,
                     method: method,
                     parameters: parameters,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    success(value as? [String: Any])
                case .failure(let error):
                    failed(error)
                }
        }
    }
    
    
    func setHost() {
        url = "https://play-ground.work/api/"
    }
    
    func setPath(path: String?) {
        if let path = path {
            url = url + path
        }
    }
}
