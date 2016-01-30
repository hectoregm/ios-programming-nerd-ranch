//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Hector Enrique Gomez Morales on 1/27/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
  var itemStore: ItemStore!

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemStore.allItems.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Value1, reuseIdentifier: "UITableViewCell")

    let item = itemStore.allItems[indexPath.row]

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = "$\(item.valueInDollars)"

    return cell
  }
}
