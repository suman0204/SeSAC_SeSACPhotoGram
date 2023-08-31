//
//  ContentViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {
    
    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //Closure - 1
    var completionHandler: ((String) -> () )?
    
    deinit {
        print("Deinit",self)
    }

    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textView)
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(250)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Closure - 2
        completionHandler?(textView.text!)
        
    }
}
