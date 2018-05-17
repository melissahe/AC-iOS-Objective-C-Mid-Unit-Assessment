//
//  CrayonsTests.m
//  CrayonsTests
//
//  Created by Alex Paul on 5/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Crayon.h"

@interface CrayonsTests : XCTestCase

@end

@implementation CrayonsTests

- (void)testCrayons {
    // setup
    NSArray *crayons = [Crayon allTheCrayons];
    NSInteger numberOfCrayons = crayons.count;
    
    // test
    XCTAssertEqual(numberOfCrayons, 16);
}

@end
