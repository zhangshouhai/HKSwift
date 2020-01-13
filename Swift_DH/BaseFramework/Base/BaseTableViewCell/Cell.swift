//
//  Cell.swift
//  Family
//
//  Created by mengqingzheng on 2019/11/8.
//  Copyright © 2019 AnRui. All rights reserved.
//

import UIKit

public class Cell<T: UITableViewCell> {
    
    static func registerClass(_ tableView: UITableView) {
        tableView.register(T.self, forCellReuseIdentifier: NSStringFromClass(T.self))
    }
    
    static func tableView(_ tableView: UITableView) -> T {
        let cellId = NSStringFromClass(T.self)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = T(style: .default, reuseIdentifier: cellId)
        }
        return cell as! T
    }
    
    static func identifier() -> String {
        return NSStringFromClass(T.self)
    }
}
