//
//  FoodManager.swift
//  Mey Food
//
//  Created by IndratS on 01/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import Alamofire

struct FoodManager {
    var delegate: FoodDelegate?
     let apiKey = "a158c8c637b34a4bba7f80b9900dc9e7"
     let baseURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch")
    
    /// use method delegate
    func searchReceipeD(){
        print("searchReceipeD running..")
        guard let url = baseURL else {return}
        let parameter = ["apiKey" : "\(apiKey)"
                   , "query" : "pasta"]

        AF.request(url
            , method: .get
        ,parameters: parameter
        ).response { (response) in
            switch response.result {
            case .failure(let err):
                print(err)
            case .success(let data):
                if let dataD = data {
                    self.parsingJSOND(dataD)
                }
            }
        }

    }

    func parsingJSOND(_ data: Data){
        print("parsingjsonD running..")
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(FoodModel.self, from: data)
            delegate?.getResultReceipe(decoderData)
            print("decoder running..")
        } catch let err{
            print(err)
        }
    }
    
    
}
