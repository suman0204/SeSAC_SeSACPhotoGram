//
//  AddView.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let searchButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    let searchProtocolButton = {
        let view = UIButton()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let dateButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        view.setTitle(DateFormatter.today(), for: .normal)
        return view
    }()
    
    override func configureView() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(searchProtocolButton)
        addSubview(dateButton)
    }
    
    override func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.trailing.equalTo(photoImageView)
        }
        
        searchProtocolButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.leading.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
}
