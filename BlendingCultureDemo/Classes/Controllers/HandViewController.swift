//
//  HandViewController.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/28.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class HandViewController: UITableViewController {
    
    private var dataSource  = HandDataSource()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(CardCell.self, forCellReuseIdentifier: "cardCell")
        tableView.dataSource = dataSource
        self.navigationItem.leftBarButtonItem = editButtonItem()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add,
            target: self,
            action: "addNewCard:")
    }
    
    @objc private func addNewCard(sender: UIBarButtonItem) {
        dataSource.addItemTo(tableView)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CardCell.height
    }
}
