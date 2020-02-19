//
//  TableDataSource.swift
//  GenericTableView
//
//  Created by Brandon Baars on 2/16/20.
//  Copyright © 2020 Brandon Baars. All rights reserved.
//

import UIKit

class TableDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var items: [CellConfigurator]
    private var tableView: UITableView
    
    private(set) var actionsProxy = CellActionProxy()
    
    init(tableView: UITableView, items: [CellConfigurator]) {
        self.items = items
        self.tableView = tableView
        
        super.init()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onActionEvent(notif:)),
                                               name: CellAction.notificationName,
                                               object: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseIdentifier, for: indexPath)
        
        item.configure(cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let configurator = items[indexPath.row]
            actionsProxy.invoke(action: .didSelect, cell: cell, configurator: configurator)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let configurator = items[indexPath.row]
        actionsProxy.invoke(action: .willDisplay, cell: cell, configurator: configurator)
    }
    
    @objc
    private func onActionEvent(notif: Notification) {
        if let eventData = notif.userInfo?["data"] as? CellActionEventData {
            if let cell = eventData.cell as? UITableViewCell {
                if let indexPath = tableView.indexPath(for: cell) {
                    actionsProxy.invoke(action: eventData.action,
                                        cell: cell,
                                        configurator: self.items[indexPath.row])
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
