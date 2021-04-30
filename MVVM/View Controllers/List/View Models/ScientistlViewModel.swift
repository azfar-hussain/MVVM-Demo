//
//  ListCellViewModel.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import Foundation

class ScientistViewModel {
  
  var name: String = ""
  var citizenship: String = ""
  var field: String = ""
  var image: String = ""
  
  init(scientist: Scientist) {
    self.name = scientist.name
    self.citizenship = scientist.country
    self.field = scientist.subject
    self.image = scientist.image
  }
  
}
