//
//  ItemStore.swift
//  Homepwner
//
//  Created by Hector Enrique Gomez Morales on 1/29/16.
//  Copyright © 2016 Hector Enrique Gomez Morales. All rights reserved.
//

import UIKit

class ItemStore {
  var allItems = [Item]()

  func createItem() -> Item {
    let newItem = Item(random: true)

    allItems.append(newItem)

    return newItem
  }
}
