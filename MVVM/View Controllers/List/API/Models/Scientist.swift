//
//  Scientist.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import Foundation

struct Scientist:Codable {
  
  var name: String
  var country: String
  var subject: String
  var image: String

  enum CodingKeys: String, CodingKey {
    case name = "full_name"
    case country = "affiliation"
    case subject = "contribution"
    case image = "picture"
  }
}
