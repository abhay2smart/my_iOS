//
//  ViewController.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var tableView: UITableView?
    
    // local vars
    private var instrumentTableViewAdapter = InstrumentTableViewAdapter()
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.instrumentTableViewAdapter.initialisation(root: self, tableView: self.tableView)
    }
}

// IBActions

extension ViewController {
    @IBAction func sortByAction(_ sender: UIButton?) {
//
//        guard let controller = SortViewController.instance() else {
//            return
//        }
//        controller.sortByCallBAck = { sortByOptions in
//            self.instrumentTableViewAdapter.sortBy(sortOptions: sortByOptions)
//            controller.dismiss(animated: true, completion: nil)
//        }
//        self.navigationController?.present(controller, animated: true, completion: nil)
        let items = [URL(string: "https://www.apple.com")!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
        
    }
}

