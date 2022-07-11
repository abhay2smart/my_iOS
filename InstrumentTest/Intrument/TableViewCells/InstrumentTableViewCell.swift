//
//  InstrumentTableViewCell.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import UIKit

class InstrumentTableViewCell: UITableViewCell {
    @IBOutlet weak var instrmentNameLbl: UILabel?
    
    @IBOutlet weak var symbolLbl: UILabel?
    @IBOutlet weak var bidLabel: UILabel?
    @IBOutlet weak var priceLbl: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// helper function

extension InstrumentTableViewCell {
    func fillInfo(info: Instrument?) {
        guard let info = info else {
            return
        }
        self.instrmentNameLbl?.text = info.name
        self.symbolLbl?.text = info.sourceSymbol
        //self.bidLabel
        self.priceLbl?.text = String(info.unitPrice ?? 0)
    }
}
