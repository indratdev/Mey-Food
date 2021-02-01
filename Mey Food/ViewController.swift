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
    
    var foodManager = FoodManager()
    var delegate: FoodDelegate?
    
    var listResult: FoodModel? {
        didSet {
            DispatchQueue.main.async {
                print(self.listResult?.results)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAPI()
    }
    
    func loadAPI(){
        foodManager.searchReceipe() {[weak self] result in
            switch result {
            case .failure(let err):
                print("Error : \(err)")
            case .success(let dataSuccess):
                self?.listResult = dataSuccess
            }
        }
    }
    
}

