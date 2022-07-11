//
//  SortViewController.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import UIKit

enum SortOptions{
    case name
    case symbol
}

class SortViewController: UIViewController {
    @IBOutlet weak var sortByContainerView: UIView?
    
    var sortByCallBAck: ((_ sortByOption:SortOptions)->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopCorners()
    }
}

// storyboard instance
extension SortViewController {
    class func instance()->SortViewController? {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sort_vc") as? SortViewController
        return controller
        
    }
}

//IBActions

extension SortViewController {
    @IBAction func sortByNameAction(_sender: UIButton?) {
        sortByCallBAck?(SortOptions.name)
    }
    
    @IBAction func sortBySymbolAction(_sender: UIButton?) {
        sortByCallBAck?(SortOptions.symbol)
    }
    
    @IBAction func backViewButtonAction(_sender: UIButton?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//Layout

extension SortViewController {
    private func setTopCorners() {
        sortByContainerView?.clipsToBounds = true
        sortByContainerView?.layer.cornerRadius = 10
        sortByContainerView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}


