//
//  ListViewModel.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import Foundation

class ListViewModel {
  
  var service: APIProtocol?
  var persons: [ScientistViewModel]? {
    didSet {
      if let scientists = persons {
        updateClosure?(scientists)
      }
    }
  }
  var updateClosure: (([ScientistViewModel])->Void)?

  init(service: APIProtocol) {
    self.service = service
  }
  
  func assignPersons(persons: [Scientist]) {
    var scientists = [ScientistViewModel]()
    persons.forEach {
      let scientist = ScientistViewModel(scientist: $0)
      scientists.append(scientist)
    }
    self.persons = scientists
  }
  
  func retrieveScientistsList() {
    service?.fetchPersonList(completion: { scientists in
      self.assignPersons(persons: scientists)
    }, failure: nil)
  }
}
