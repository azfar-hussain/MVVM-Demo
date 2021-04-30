//
//  ListViewController.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import UIKit

class ListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var dataSource: ListDataSource = ListDataSource()
  var viewModel: ListViewModel = ListViewModel(service: LocalAPIService())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.tableView.dataSource = dataSource
    viewModel.updateClosure = { scientists in
      self.dataSource.update(list: scientists)
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
     }
    viewModel.retrieveScientistsList()
  }


}
