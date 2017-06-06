//
//  FBPost_Swift23Tests.swift
//  FBPost_Swift23Tests
//
//  Created by Luthfi Fathur Rahman on 10/22/16.
//  Copyright © 2016 Imperio Teknologi Indonesia. All rights reserved.
//

import XCTest
@testable import FBPost_Swift23

class FBPost_Swift23Tests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFBPost_Swift23() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true)
    }
    
    func testPerformanceFBPost_Swift23() {
        // This is an example of a performance test case.
        /*self.measure {
            // Put the code you want to measure the time of here.
        }*/
    }
    
}
