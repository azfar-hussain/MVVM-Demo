//
//  API.swift
//  MVVM
//
//  Created by Azfar Hussain on 30/04/2021.
//

import Foundation

protocol APIProtocol {
  func fetchPersonList(completion:(([Scientist])->Void)?, failure:((Error)->Void)?)
}

class LocalAPIService: APIProtocol {
  
  let jsonString = """
  [
      {
          "full_name": "Albert Einstein",
          "affiliation": "United States",
          "contribution": "Physics",
          "picture": "scientist0"
      }, {
          "full_name": "Kurt Godel",
          "affiliation": "Austria",
          "contribution": "Mathematics",
          "picture": "scientist1"
      }, {
          "full_name": "John von Neumann",
          "affiliation": "United States",
          "contribution": "Mathematics",
          "picture": "scientist2"
      }, {
          "full_name": "Edsger W. Dijkstra",
          "affiliation": "Netherlands",
          "contribution": "Computer Science",
          "picture": "scientist3"
      }, {
          "full_name": "Claude Shannon",
          "affiliation": "United States",
          "contribution": "Mathematics",
          "picture": "scientist4"
      }, {
          "full_name": "Harry Nyquist",
          "affiliation": "Sweden",
          "contribution": "Electronics",
          "picture": "scientist5"
      }, {
          "full_name": "Donald Knuth",
          "affiliation": "United States",
          "contribution": "Computer Science",
          "picture": "scientist6"
      }, {
          "full_name": "Clyde Kruskal",
          "affiliation": "United States",
          "contribution": "Computer Science",
          "picture": "scientist7"
      }, {
          "full_name": "Robert C. Prim",
          "affiliation": "United States",
          "contribution": "Computer Science",
          "picture": "scientist8"
      }, {
          "full_name": "Alan Turing",
          "affiliation": "United Kingdom",
          "contribution": "Computer Science",
          "picture": "scientist9"
      }
  ]
  """
  
  func fetchPersonList(completion: (([Scientist]) -> Void)?, failure: ((Error) -> Void)?) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.75, execute: {
      let jsonData = self.jsonString.data(using: .utf8)!
      if let response = try? JSONDecoder().decode([Scientist]?.self, from: jsonData) {
        let now = Date().timeIntervalSinceReferenceDate
        let count = now.truncatingRemainder(dividingBy: 10)
        var result = Array(response[Int(count)..<response.count])
        result = result + response[0..<Int(count)]
        completion?(result)
      } else {
        let error = NSError(domain: "Invalid Response", code: -1, userInfo: ["reason": "Decoding error"])
        failure?(error)
      }
    })
  }
}
