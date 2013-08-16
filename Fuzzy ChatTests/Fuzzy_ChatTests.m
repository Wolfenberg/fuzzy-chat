//
//  Fuzzy_ChatTests.m
//  Fuzzy ChatTests
//
//  Created by Dmitry Volkov on 15/08/2013.
//  Copyright (c) 2013 Dmitry Volkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+FCUtils.h"

@interface Fuzzy_ChatTests : XCTestCase {
    NSString *originalString;
    NSString *mixedString;
    NSArray *originalWords;
    NSArray *mixedWords;
}

@end

@implementation Fuzzy_ChatTests

- (void)setUp
{
    [super setUp];
    
    originalString = @"Привет, как делишки?";
    mixedString = [originalString stringWithMixedWords];
    NSLog(@"\"%@\" : \"%@\"", originalString, mixedString);
    
    originalWords = [originalString componentsSeparatedByString:FCWhiteSpace];
    mixedWords = [mixedString componentsSeparatedByString:FCWhiteSpace];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLength
{
    XCTAssertEqual([originalString length], [mixedString length], @"Length of result string should be the same.");
}

- (void)testFirstCharacter
{
    [originalString enumerateSubstringsInRange:NSMakeRange(0, [originalString length])
                                    options:NSStringEnumerationByWords
                                 usingBlock:
     ^(NSString *originalWord, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         NSString *mixedWord = [mixedString substringWithRange:substringRange];
         
         XCTAssertEqual([originalWord characterAtIndex:0],
                        [mixedWord characterAtIndex:0],
                        @"First char should be unchanged. Failed word (\"%@\" : \"%@\")", originalWord, mixedWord);
         }];
}

- (void)testLastCharacter
{
    [originalString enumerateSubstringsInRange:NSMakeRange(0, [originalString length])
                                       options:NSStringEnumerationByWords
                                    usingBlock:
     ^(NSString *originalWord, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         NSString *mixedWord = [mixedString substringWithRange:substringRange];
         
         XCTAssertEqual([originalWord characterAtIndex:[originalWord length] - 1],
                        [mixedWord characterAtIndex:[mixedWord length] - 1],
                        @"Last char should be unchanged. Failed word (\"%@\" : \"%@\")", originalWord, mixedWord);
     }];
}

- (void)testMixOfInnerCharacters
{
    [originalString enumerateSubstringsInRange:NSMakeRange(0, [originalString length])
                                       options:NSStringEnumerationByWords
                                    usingBlock:
     ^(NSString *originalWord, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         NSString *mixedWord = [mixedString substringWithRange:substringRange];
         
         if ([originalWord length] > 3)
             XCTAssertNotEqual([originalWord substringWithRange:NSMakeRange(1, [originalWord length] - 2)],
                               [mixedWord substringWithRange:NSMakeRange(1, [mixedWord length] - 2)],
                               @"Inner characters shouldn't be equal to original.");
     }];
}

@end
