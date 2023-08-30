//
//  UnsplashAPIManager.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/30.
//

import Foundation
import Alamofire

class UnsplashAPIManager {
    
    static let shared = UnsplashAPIManager()
    
    private init() {  }
    
    
    func callSearchRequest(query: String, success: @escaping (SearchImage) -> Void, failure: @escaping () -> Void) {
        let url = "https://api.unsplash.com/search/photos?page=1&query=\(query)&client_id=\(APIKey.unsplashAccessKey)"
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: SearchImage.self) { response in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }
    
}
