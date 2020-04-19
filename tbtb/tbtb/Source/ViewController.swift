//
//  ViewController.swift
//  tbtb
//
//  Created by 김준성 on 2020/04/19.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var searchTextfield: UITextField!{
        didSet{
            self.searchTextfield.delegate = self
            //검색하는 텍스트필드를 delegate로 선언
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           //뷰 로딩시 텍스트필드 자동 포커스
           self.searchTextfield.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            //textfield 포커스 잃기 그러므로 자동으로 키보드 내려감
            self.searchTextfield.resignFirstResponder()
    }
    
    @IBAction func showSettingView(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "settingVC") as! SettingViewController
        // view controller 코드로 segue전환
        // 강제 형변환 필요
        
        self.present(vc, animated: true, completion: nil)
    }
        
    // return키 누를 때, 키보드 내려가는 기능위한 UITextFieldDelegate 채택
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            //키보드 return키 누를 때, 포커스 잃으면서 현재 키보드 사라지는 거
            self.searchTextfield.resignFirstResponder()
            self.dismiss(animated: true, completion: nil)
            let vc = self.storyboard?.instantiateViewController(identifier: "ItemVC") as! ItemViewController
            // view controller 코드로 segue전환
            // 강제 형변환 필요
//            vc.modalTransitionStyle = .coverVertical
//            self.present(vc, animated: true, completion: nil)
        self.performSegue(withIdentifier: "showItemVC", sender: self)
            return true
        }
    
    
}

