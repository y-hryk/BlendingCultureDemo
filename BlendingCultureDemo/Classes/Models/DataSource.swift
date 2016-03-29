//
//  DataSource.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/29.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, SourceType {
    
    var dataObject: DataType
    
    var conditionForAdding: Bool {
        return false
    }
    
    init<T: DataType>(dataObject: T) {
        self.dataObject = dataObject
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataObject.numberOfItems
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            guard let cell = tableView
                .dequeueReusableCellWithIdentifier("cardCell",
                    forIndexPath: indexPath)
                as? CardCell, hand = dataObject as? Hand else {
                    
                    fatalError("Could not create CardCell or Hand instance")
            }
            
            cell.fillWith(hand[indexPath.row])
            return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataObject = dataObject.deleteItemAtIndex(indexPath.row)
            deleteRowAtIndexPath(indexPath, from: tableView)
        }
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        dataObject = dataObject.moveItem(fromIndexPath.row, toIndex: toIndexPath.row)
    }
}
