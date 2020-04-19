//
//  ItemViewController.swift
//  tbtb
//
//  Created by 김준성 on 2020/04/19.
//  Copyright © 2020 김준성. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //dummy data
    @IBOutlet weak var itemTableView: UITableView!
    
    var dataList : [[String : String]] = []
    var nameList : [String] = ["신발-a", "신발-b", "신발-c", "신발-d", "신발-e", "신발-f", "신발-g", "신발-h", "신발-i", "신발-j", "신발-k", "신발-l", "신발-m", "신발-n", "신발-o", "신발-p", "신발-q", "신발-r", "신발-s", "신발-t", "신발-u", "신발-v", "신발-w", "신발-x", "신발-y", "신발-z"]
    var priceList : [String] = []
    var tagList : [String] = ["편안", "행복", "값싼", "비싼", "불편", "늘어남", "맛있음", "빡셈", "별로", "플렉스", "아담", "맛없음", "빠끄"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...25{
            priceList.append(String(Int.random(in: 50000...250000)))
        }
        
        print(priceList)
        
        for index in 0...25{
            dataList.append(["name" : nameList[index], "price" : priceList[index], "tag" : tagList[Int.random(in: 0...12)]])
        }
        //custom cell에 필요한 delegate선언 필수, 없으면 cell이 반환이 안됨
        itemTableView.delegate = self
        itemTableView.dataSource = self
        print(dataList)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 총 셀의 행의 갯수를 리턴
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //각 셀마다 적용되는 부분이고, 하나의 셀을 반환한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        cell.cellDelegate = self
        cell.itemNameLabel.text = "상품명 " + "\(dataList[indexPath.row]["name"] ?? "default")" //"상품명 " +
        cell.itemPriceLabel.text = "상품가격 " + "\(dataList[indexPath.row]["price"] ?? "0")" + "원" //"상품가격 " +
        cell.itemTag.text = "상품태그 " + "\(dataList[indexPath.row]["tag"] ?? "default")" // "상품태그 "
        cell.showDetailBttn.tag = indexPath.row
//        cell.showDetailBttn.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
//          cell에 객체하나당 하나씩 접근할 수 있도록 만드는 거
//          isAccessibilityElement = false
//          cell.itemNameLabel.isAccessibilityElement = true
//          cell.itemPriceLabel.isAccessibilityElement = true
//          cell.itemTag.isAccessibilityElement = true
        return cell
    }
//    @objc func connected(sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "detailVC") as! DetailViewController
//        vc.name = "dasdsa"
//
//        // logic to pass present detailVC
//    }
}

//각 cell마다 있는 버튼을 클릭시 indexPath row 인식하기.
//여기서 데이터 보내는거 하면 될듯 싶다.
extension ItemViewController : CustomCellDelegate{
    func customcell(cell: ItemTableViewCell, didTappedThe button: UIButton?) {
        guard let indexPath = itemTableView.indexPath(for: cell) else {return}
        let vc = self.storyboard?.instantiateViewController(identifier: "detailVC") as! DetailViewController
        vc.name = dataList[indexPath.row]["name"]!
        vc.price = dataList[indexPath.row]["price"]!
        vc.tag = dataList[indexPath.row]["tag"]!
        show(vc, sender: nil)
        
    }
}
