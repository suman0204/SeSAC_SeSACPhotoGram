//
//  DateView.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class DateView: BaseView {
    let datePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        return view
    }()
    
    override func configureView() {
        addSubview(datePicker)
    }
    
    override func setConstraints() {
        //datepicker는 정해진 크기가 있기 때문에 탑과 수직 수평 정도 맞추면 된다
        datePicker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
//            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
}
