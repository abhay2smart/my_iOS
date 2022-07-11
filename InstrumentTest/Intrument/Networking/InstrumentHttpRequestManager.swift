//
//  InstrumentHttpRequestManager.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import Alamofire
import SwiftyJSON

class InstrumentHttpRequestManager {
    func getInstruments(completion: @escaping ((_ success : Bool, _ error : String?, _ response : InstrumentModel?)->())) {
        let endPoint = "https://md.lmaxglobal.io/fixprof/instruments/prices"
        AF.request(endPoint).response { response in
            switch response.result {
            case .success(let value):
                let responseJSON = JSON(value)
                print("abhay \(responseJSON)")
                let parsedData = InstrumentModel(info: responseJSON)
                completion(true, nil, parsedData)
            case .failure(let error):
                completion(false, error.localizedDescription, nil)
                print(error)
                break
            }
        }
        
    }
}
