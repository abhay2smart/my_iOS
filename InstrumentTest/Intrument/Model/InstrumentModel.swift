//
//  InstrumentModel.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import SwiftyJSON

class InstrumentModel  {
    var status: String?
    var instruments: [Instrument]?
    init(info: JSON?) {
        guard let info = info else {
            return
        }
        self.status = info["status"].stringValue
        var instrumentsList = [Instrument]()
        
        let USDNOK = Instrument(info: info["instruments"]["USDNOK"])
        let AUS200 = Instrument(info: info["instruments"]["AUS200"])
        let XBRUSD = Instrument(info: info["instruments"]["XBRUSD"])
        let USDCHF = Instrument(info: info["instruments"]["USDCHF"])
        let EURCHF = Instrument(info: info["instruments"]["EURCHF"])
        let USDZAR = Instrument(info: info["instruments"]["USDZAR"])
        let XAUEUR = Instrument(info: info["instruments"]["XAUEUR"])
        let NZDCHF = Instrument(info: info["instruments"]["NZDCHF"])
        let NZDSGD = Instrument(info: info["instruments"]["NZDSGD"])
        let GDAXIm = Instrument(info: info["instruments"]["GDAXIm"])
        let XAGAUD = Instrument(info: info["instruments"]["XAGAUD"])
        let USDHUF = Instrument(info: info["instruments"]["USDHUF"])
        let EURZAR = Instrument(info: info["instruments"]["EURZAR"])
        let GBPMXN = Instrument(info: info["instruments"]["GBPMXN"])
        let HSI = Instrument(info: info["instruments"]["HSI"])
        let UK100 = Instrument(info: info["instruments"]["UK100"])
        let XETJPY = Instrument(info: info["instruments"]["XETJPY"])
        let NDXm = Instrument(info: info["instruments"]["NDXm"])
        
        
        
        
        
        instrumentsList.append(USDNOK)
        instrumentsList.append(AUS200)
        instrumentsList.append(XBRUSD)
        instrumentsList.append(USDCHF)
        instrumentsList.append(EURCHF)
        instrumentsList.append(USDZAR)
        instrumentsList.append(XAUEUR)
        instrumentsList.append(NZDCHF)
        
        instrumentsList.append(NZDSGD)
        instrumentsList.append(GDAXIm)
        instrumentsList.append(XAGAUD)
        instrumentsList.append(USDHUF)
        instrumentsList.append(EURZAR)
        instrumentsList.append(GBPMXN)
        instrumentsList.append(HSI)
        instrumentsList.append(UK100)
        instrumentsList.append(XETJPY)
        instrumentsList.append(NDXm)
        
        self.instruments = instrumentsList
    }
}

class Instrument {
    var id: String?
    var name: String?
    var assetClass: String?
    var sourceSymbol: String?
    var unitPrice: Float?
    var quantityIncrement: String?
    
    
    init(info: JSON?) {
        guard let info = info else {
            return
        }
        self.id = info["id"].stringValue
        self.name = info["name"].stringValue
        self.assetClass = info["assetClass"].stringValue
        self.sourceSymbol = info["source_symbol"].stringValue
        self.unitPrice = info["unitPrice"].floatValue
        self.quantityIncrement = info["quantityIncrement"].stringValue
    }
}
