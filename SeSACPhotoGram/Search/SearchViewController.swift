//
//  SearchViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {
    
    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()
    
    //호출할 필요 없지만 명시적으로 나타냄 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func configureView() {
        super.configureView()
        view.addSubview(searchBar)
    }
    
    override func setConstraints() {
        super.setConstraints()
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
        }
    }
    
}
