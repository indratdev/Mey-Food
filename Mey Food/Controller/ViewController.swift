//
//  ViewController.swift
//  Mey Food
//
//  Created by IndratS on 01/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var receipeSearch: UISearchBar!
    @IBOutlet weak var receipeTableView: UITableView!
    
    var foodManager = FoodManager()
    var delegate: FoodDelegate?
    var dataReceipe: FoodModel?
    
    var searchDisplay: String? {
        get {
            guard let text = receipeSearch.text else {return nil}
            return text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initReceipeTable()
        foodManager.delegate  = self
        loadAPI2()
    }
    
    func initReceipeTable(){
        receipeTableView.delegate = self
        receipeTableView.dataSource = self
        
        let uib = UINib(nibName: "ReceipeTableViewCell", bundle: nil)
        receipeTableView.register(uib, forCellReuseIdentifier: ReceipeTableViewCell.identifier)
    }
    
    func loadAPI2(){
        foodManager.searchReceipeD()
    }
    
}

extension ViewController: FoodDelegate {
    func getResultReceipe(_ data: FoodModel?) {
        self.dataReceipe = data
        DispatchQueue.main.async {
            self.receipeTableView.reloadData()
        }
    }
}

//extension ViewController: UISearchBarDelegate {
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        print(searchBar.text)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//    }
//}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataReceipe?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = receipeTableView.dequeueReusableCell(withIdentifier: ReceipeTableViewCell.identifier, for: indexPath) as! ReceipeTableViewCell
        let data = dataReceipe?.results[indexPath.row]
        
        cell.receipeNameLabel.text = data?.title
        cell.receipeImage.downloaded(from: data?.image ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ReceipeTableViewCell.heightCell)
    }
}
