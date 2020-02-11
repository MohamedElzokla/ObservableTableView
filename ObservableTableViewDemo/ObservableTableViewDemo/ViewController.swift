//
//  ViewController.swift
//  ObservableTableViewDemo
//
//  Created by mohamed ahmed on 2/11/20.
//  Copyright © 2020 elzokla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenTableView: ObservableTableview!
    @IBOutlet weak var greenTableViewHeight: NSLayoutConstraint!

    var greenObjs = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        greenTableView.onContentHeightChange = {
            self.greenTableViewHeight.constant = self.greenTableView.contentSize.height
            self.greenTableView.layoutSubviews()
        }
    }

    @IBAction func addGreen(_ sender: Any) {
        greenObjs.append("")
        greenTableView.reloadData()
    }

    
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greenObjs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
