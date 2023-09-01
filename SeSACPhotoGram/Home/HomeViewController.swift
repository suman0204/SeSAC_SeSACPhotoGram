//
//  HomeViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/31.
//

import UIKit


//AnyObject: 클래스에서만 프로토콜을 정의할 수 있도록 제약
protocol  HomeViewProtocol: AnyObject {
    func didSelectItemAt(indexPath: IndexPath)
}

class HomeViewController: BaseViewController {
        
    override func loadView() { //super메서드 호출하면 애플이 기본으로 제공한느 view로 바뀌기 때문에 우리가 만든 뷰를 쓰기 위해선 super메서드 호출하지 않는다
        let view = HomeView() //RC +1  / RC 1
        view.delegate = self // RC +1 / RC 2
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
    }
    
    deinit {
        print(self, #function)
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
    
}
