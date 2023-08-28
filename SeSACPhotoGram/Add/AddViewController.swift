//
//  ViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {

    let mainView = AddView()
    
    
    override func loadView() { //viewDidLoad보다 먼저 호출됨, super 메서드 호출 하면 안됨!
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func searchButtonClicked() {
        present(SearchViewController(), animated: true)
    }
    
    override func configureView() { //addSubView
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)

    }

    override func setConstraints() { //제약조건
        super.setConstraints()
        print("Add SetConstraints")

    }

}

