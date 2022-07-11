//
//  InstrumentTableViewAdapter.swift
//  InstrumentTest
//
//  Created by developer on 7/10/22.
//

import UIKit
class InstrumentTableViewAdapter: NSObject {
    private var tableView: UITableView?
    private var root: UIViewController?
    private var tableViewData = [Instrument]()
    private var tableViewDataTemp = [Instrument]()
    
    private var instrumentHttpRequestManager = InstrumentHttpRequestManager()
    
    func initialisation(root: UIViewController?, tableView: UITableView?) {
        self.root = root
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        self.tableView?.register(UINib(nibName: "TableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableHeaderView")
        loadData()
    }
}

// helper functions
extension InstrumentTableViewAdapter {
    private func loadData() {
    instrumentHttpRequestManager.getInstruments { [weak self] success, error, response in
        if success {
            guard let info = response?.instruments else {
                return
            }
            print("Abhay12 \(info.count)")
            self?.tableViewData = info
            self?.tableViewDataTemp = info
            self?.tableView?.reloadData()
            return
        }
        print("Something went wrong")
        }
    }
    
    func sortBy(sortOptions: SortOptions) {
        if sortOptions == SortOptions.name {
            self.tableViewData = tableViewDataTemp.sorted { ($0.name ?? "") < ($1.name ?? "") }
        } else {
            self.tableViewData = tableViewDataTemp.sorted { ($0.sourceSymbol ?? "") < ($1.sourceSymbol ?? "") }
        }
        self.tableView?.reloadData()
    }
}

// Data source

extension InstrumentTableViewAdapter: UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? InstrumentTableViewCell else {
          return UITableViewCell()
        }
        
        guard tableViewData.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.fillInfo(info: tableViewData[indexPath.row])
        
        
        return cell
    }
    
    
}

// delegate

extension InstrumentTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderView") as? TableHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableViewData.indices.contains(indexPath.row) else {
            return
        }
        guard let controller = InstrumentDetilsViewController.instance(info: tableViewData[indexPath.row]) else {
            return
        }
        
        self.root?.navigationController?.pushViewController(controller, animated: true)
        
    }
}
