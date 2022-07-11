//
//  InstrumentDetilsViewController.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import UIKit

class InstrumentDetilsViewController: UIViewController {
    @IBOutlet weak var idLbl: UILabel?
    @IBOutlet weak var nameLbl: UILabel?
    @IBOutlet weak var symbolLbl: UILabel?
    @IBOutlet weak var assetClass: UILabel?
    @IBOutlet weak var qtyLbl: UILabel?
    @IBOutlet weak var priceLbl: UILabel?
    
    
    private var instrumentInfo:Instrument?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillInfo(info: instrumentInfo)
    }
}

// Storyboard Instance
extension InstrumentDetilsViewController {
    class func instance(info: Instrument?)->InstrumentDetilsViewController? {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "details_vc") as? InstrumentDetilsViewController
        controller?.instrumentInfo = info
        return controller
    }
}

// helper functions

extension InstrumentDetilsViewController {
    private func fillInfo(info: Instrument?) {
        guard let info = info else {
            return
        }
        self.idLbl?.text = info.id
        self.nameLbl?.text = info.name
        self.priceLbl?.text = String(info.unitPrice ?? 0)
        self.symbolLbl?.text = info.sourceSymbol
        self.assetClass?.text = info.assetClass
        self.qtyLbl?.text = info.quantityIncrement
        
    }
}
