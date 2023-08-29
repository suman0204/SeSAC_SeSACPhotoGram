//
//  DateViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
    
    let mainView = DateView()
    
    //Protocol 값 전달 2.
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    //Protocol 값 전달 3.
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.receiveData(date: mainView.datePicker.date)
    }
    
}
