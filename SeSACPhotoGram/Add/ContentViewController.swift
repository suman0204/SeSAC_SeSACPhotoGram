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
    
    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let greenView = {
        let view = UIView()
        view.backgroundColor = .green
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
        view.addSubview(sampleView)
        view.addSubview(greenView)
        setAnimation()
        
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(250)
        }
        
        sampleView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view)
        }
        
        greenView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalTo(view).offset(80)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Closure - 2
        completionHandler?(textView.text!)
        
    }
    
    //animation
    func setAnimation() {
        //시작할 때 UI
        sampleView.alpha = 0
        greenView.alpha = 0
        //끝날 때 UI
//        UIView.animate(withDuration: 3) {
//            self.sampleView.alpha = 1
//        }
        
        UIView.animate(withDuration: 1, delay: 2, options: .curveLinear) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .blue
        } completion: { bool in
            
            UIView.animate(withDuration: 1) {
                self.greenView.alpha = 1
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 1.0
            
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 0.5
            
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 1.0
            }
        }
    }
    
}
