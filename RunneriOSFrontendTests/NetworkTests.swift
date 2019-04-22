//
//  NetworkTests.swift
//  RunneriOSFrontendTests
//
//  Created by Eric Castronovo on 4/22/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//

import XCTest
import Alamofire
@testable import RunneriOSFrontend

class NetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBackend() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        Alamofire.request("http://localhost:8000/task/").responseJSON { (response) in
            //let result = response.result
            //print(response.response!.statusCode)
            
            //Will fail if no internet connection
            XCTAssertEqual(response.response!.statusCode, 200)
        }
        
    }
    
    func testLogin() {
        //Will fail if there is an error with sign-in
        
        let parameters: Parameters =  [
                        "username": "Dimple",
                        "password": "dimple"
        ]
        
        Alamofire.request("http://localhost:8000/api-token-auth/", method: .post, parameters: parameters, encoding: JSONEncoding.default)  .responseJSON { (response) in
            
            //Will fail if not able to test login
            XCTAssertEqual(response.response!.statusCode, 200)
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
