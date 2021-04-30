//
//  ListDataSource.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import UIKit

class ListDataSource: NSObject, UITableViewDataSource {
  
  var list = [ScientistViewModel]()
  let cellReuseIdentifier = "ScientistCell"
  
  func update(list: [ScientistViewModel]) {
    self.list = list
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ScientistCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ScientistCell
    cell.configure(model: list[indexPath.row])
    return cell
  }
  
}
