//
//  util.swift
//  ggumbang-ios
//
//  Created by Changhoon Lee on 31/05/2019.
//  Copyright © 2019 6londe. All rights reserved.
//

import Foundation

class Http {
    
    let baseUrl: String
    let session = URLSession.shared
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func get(_ url: String, _ callback: @escaping (String) -> ()) {
        let task = session.dataTask(with: URL(string: baseUrl + url)!) {(data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            callback(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    func post(_ url: String, _ parameters: Encodable, _ callback: @escaping (String) -> ()) {
        
        // TODO Convert parameters to body
        let body = ["abc":"def"]
        
        var request = URLRequest(url: URL(string: baseUrl + url)!)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            callback(String(data: data, encoding: .utf8)!)
        })
        task.resume()
    }
}
