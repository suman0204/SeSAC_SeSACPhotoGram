//
//  ViewController.swift
//  SeSACPhotoGram
//
//  Created by 홍수만 on 2023/08/28.
//

import UIKit
import SeSACPhotoFramework

//Protocol 값 전달 1.
protocol PassDataDelegate {
    func receiveData(date: Date)
}

protocol PassImageDelegate {
    func receiveImage(image: UIImage)
}

class AddViewController: BaseViewController {

    let mainView = AddView()
    
    let picker = UIImagePickerController()
    
    override func loadView() { //viewDidLoad보다 먼저 호출됨, super 메서드 호출 하면 안됨!
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIService.shared.callRequest()

        ClassOpenExample.publicExample()
        ClassPublicExample.publicExample()
//        ClassPublicExample.internalExample()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
        
        //framework에 public으로 선언된 메서드
//        sesacShowActivityViewController(image: UIImage(systemName: "star")!, url: "hello", text: "hi")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
    }
    

    
    override func configureView() { //addSubView
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        mainView.searchProtocolButton.addTarget(self, action: #selector(actionSheet), for: .touchUpInside)

        mainView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        
        mainView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        
        mainView.contentButton.addTarget(self, action: #selector(contentButtonClicked), for: .touchUpInside)
        
//        APIService.shared.callRequest()
//        APIService()

    }
    

    override func setConstraints() { //제약조건
        super.setConstraints()
        print("Add SetConstraints")

    }

}

//Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {
    func receiveData(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.converDate(date: date), for: .normal)
    }
    
}

extension AddViewController: PassImageDelegate {
    func receiveImage(image: UIImage) {
        mainView.photoImageView.image = image
    }
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //취소 버튼 클릭시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }
    
    //사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.mainView.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}

extension AddViewController {
    
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print(#function)
//        print("selectImageNotificationObserver")
//        print(notification.userInfo?["name"])
//        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    @objc func searchButtonClicked() {
        
        let word = ["Apple", "Banna", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()! ])
        
        navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    @objc func contentButtonClicked() {
        let vc = ContentViewController()
        
        vc.completionHandler = { content in
            self.mainView.contentButton.setTitle(content, for: .normal)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func titleButtonClicked() {
        let vc = TitleViewController()
        
        //Closure - 3
        vc.completionHandler = { title, age, push in
            self.mainView.titleButton.setTitle(title, for: .normal)
            print("completionHandler", age, push)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonClicked() {
        let vc = SearchViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func dateButtonClicked() {
        //Protocol 값 전달 5.
        let vc = DateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func actionSheet() {
        print("clicked")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for item in SheetType.allCases {
            print(item)
            print(item.rawValue)
            actionSheet.addAction(UIAlertAction(title: item.rawValue, style: .default, handler: { UIAlertAction in
                
                if item == .gallery {
                    print("\(item.rawValue)선택")
                    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                        print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
                        return
                    }
                    self.picker.delegate = self
                    self.picker.sourceType = .photoLibrary
                    self.picker.allowsEditing = true
                    
                    self.present(self.picker, animated: true)
                    
                } else if item == .webSearch {
                    print("\(item.rawValue)선택")
                }
            }))
        }

        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(actionSheet, animated: true, completion: nil)
    }
}

enum SheetType: String, CaseIterable {
    case gallery = "갤러리에서 가져오기"
    case webSearch = "웹에서 검색하기"
}
