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

  @IBAction func addNewItem(sender: AnyObject) {

  }

  @IBAction func toggleEditingMode(sender: AnyObject) {
    if editing {
      sender.setTitle("Edit", forState: .Normal)

      setEditing(false, animated: true)
    } else {
      sender.setTitle("Done", forState: .Normal)

      setEditing(true, animated: true)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height

    let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemStore.allItems.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)

    let item = itemStore.allItems[indexPath.row]

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = "$\(item.valueInDollars)"

    return cell
  }
}
