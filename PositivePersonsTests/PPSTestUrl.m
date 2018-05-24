//
//  PPSTestUrl.m
//  PositivePersonsTests
//
//  Created by ZHUYN on 2018/5/24.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+PPSAddition.h"

@interface PPSTestUrl : XCTestCase

@end

@implementation PPSTestUrl

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testURL
{
    NSString *urlString = @"https://www.sina.com";
    XCTAssertTrue([urlString isURLSchemeTypeHttps]);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
