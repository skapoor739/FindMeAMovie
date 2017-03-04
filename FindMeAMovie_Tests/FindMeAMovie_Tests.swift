//
//  FindMeAMovie_Tests.swift
//  FindMeAMovie_Tests
//
//  Created by Shivam Kapur on 05/03/17.
//  Copyright © 2017 ShivamKapoor. All rights reserved.
//

import XCTest
@testable import FindMeAMovie_

class FindMeAMovie_Tests: XCTestCase {
    
    var homeController = HomeController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    

    func testMovieSearch() {
        let expectedResult = expectation(description: "closureTest")
        
        //MARK: change the name of the variable to analyze test different test cases
        let movieTitle = "John Wick"
        Movie.getMovieObject(name: movieTitle) { (movie) in
                if movie != nil {
                    XCTAssert(true, "Movie name exists")
                }   else {
                    XCTAssert(false, "Movie name does not exist")
                }
                
                expectedResult.fulfill()

        }
    
        waitForExpectations(timeout: 3) { (error) in
            if error != nil {
                XCTFail("Test Case Failed")
            }
        }
    }
}
