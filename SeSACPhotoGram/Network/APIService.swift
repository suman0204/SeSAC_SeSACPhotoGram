//
//  APIService.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/30.
//

import Foundation

class APIService {
    private init() { }
    
    static let shared = APIService() //인스턴스 생성 방지
    
    func callRequest() {
        
        let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg")
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            let value = String(data: data!, encoding: .utf8)
            print(value)
            
            print(response)
            print(error)
        }.resume() // resume - 데이터 통신을 시작하라는 트리거
    }
    
}
