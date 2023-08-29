//
//  DateFormat+Extension.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/29.
//

import Foundation

extension DateFormatter {
    static let format = {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        return format
    }()
    
    static func today() -> String {
        return format.string(from: Date())
    }
    
    static func converDate(date: Date) -> String {
        return format.string(from: date)
    }
}
