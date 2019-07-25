//
//  SCNetworkManager+extension.swift
//  MyFishInfo
//
//  Created by Stephen Cao on 25/7/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

import Foundation
import Alamofire

extension SCNetworkManager{
    func getSpeciesData(completion:@escaping (_ data: Data?, _ isSuccess: Bool)->()){
        request(urlString: InfoCommon.baseUrl, method: HTTPMethod.get, params: nil) { (data, _, isSuccess, _, _) in
            completion(data, isSuccess)
        }
    }
}
