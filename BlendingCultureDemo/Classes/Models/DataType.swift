//
//  DataType.swift
//  BlendingCultureDemo
//
//  Created by yamaguchi on 2016/03/29.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

protocol DataType {
    var numberOfItems: Int { get }
    func addNewItemAtIndex(index: Int) -> Self
    func deleteItemAtIndex(index: Int) -> Self
    func moveItem(fromIndex: Int, toIndex: Int) -> Self
}
