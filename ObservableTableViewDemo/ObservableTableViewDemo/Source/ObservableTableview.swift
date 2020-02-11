//
//  ObservableTableview.swift
//  ObservableTableViewDemo
//
//  Created by mohamed ahmed on 2/11/20.
//  Copyright © 2020 elzokla. All rights reserved.
//

import UIKit

class ObservableTableview: UITableView {
    var onContentHeightChange : ActionBlock?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    deinit {
        removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == self && keyPath == "contentSize" {
                print("ContentSize = \(obj.contentSize)")
                self.onContentHeightChange?()
            }
        }
    }
}
