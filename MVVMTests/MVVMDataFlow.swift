//
//  MVVMDataFlow.swift
//  MVVMTests
//
//  Created by Azfar Hussain on 30/04/2021.
//

import XCTest

class MVVMDataFlow: XCTestCase {
  
    var api: MockAPIService?
    var viewModel: ListViewModel?
    var dataSource: ListDataSource?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      api = MockAPIService()
      if let api = api {
        viewModel = ListViewModel(service: api)
        dataSource = ListDataSource()
      }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataFlow() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
      let expectation = XCTestExpectation(description: "Download and complete transfer of scientists list")
      viewModel?.updateClosure = { scientists in
        self.dataSource?.update(list: scientists)
        expectation.fulfill()
      }
      viewModel?.retrieveScientistsList()
      wait(for: [expectation], timeout: 2)
      XCTAssertEqual(api?.store?.count, viewModel?.persons?.count)
      XCTAssertEqual(viewModel?.persons?.count, dataSource?.list.count)
    }
  
    func testModelViewModelEquivalency() throws {
      let model = Scientist(name: "Joseph Ledoux", country: "United States", subject: "Neuroscience", image: "scientistx")
      let viewModel = ScientistViewModel(scientist: model)
      XCTAssertEqual(model.country, viewModel.citizenship)
      XCTAssertEqual(model.image, viewModel.image)
      XCTAssertEqual(model.name, viewModel.name)
      XCTAssertEqual(model.subject, viewModel.field)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
