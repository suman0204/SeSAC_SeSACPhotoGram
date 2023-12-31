//
//  SearchViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit
import Kingfisher


class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    var sheetType: SheetType?
    
    var searchedImage: SearchImage?
//    {
//        didSet {
//            self.col
//        }
//    }
    
    //Protocol 값 전달 2.
    var delegate: PassImageDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    //호출할 필요 없지만 명시적으로 나타냄 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKeyword"), object: nil)

        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        

//        print("SearchViewController", searchedImage?.results[0].urls.thumb)
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

    @objc func recommandKeywordNotificationObserver(notification: NSNotification) {
        print("recommandKeywordNotificationObserver")
    }
    
    override func configureView() {
        super.configureView()
//        mainView.collectionViewLayout()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if sheetType == .webSearch {
            guard let url = searchedImage?.results[indexPath.row].urls.thumb else {return UICollectionViewCell()}
            print("searchedURL",url)
            cell.imageView.kf.setImage(with: URL(string: url))

        } else {
            cell.imageView.image = UIImage(systemName: imageList[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(imageList[indexPath.item])
        
        //Notification을 통한 값전달
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: [ "name" : imageList[indexPath.item], "sample" : "고래밥" ])
        
        //Protocol 값 전달
        if sheetType == .webSearch {
            guard let url = searchedImage?.results[indexPath.row].urls.thumb else {return}

//            delegate?.receiveImage(image: UIImage(url))
        }
        delegate?.receiveImage(image: UIImage(systemName: imageList[indexPath.item])!)

        
        dismiss(animated: true)
    }
    
}
