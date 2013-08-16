//
//  NSString+FCUtils.m
//  Fuzzy Chat
//
//  Created by Dmitry Volkov on 15/08/2013.
//  Copyright (c) 2013 Dmitry Volkov. All rights reserved.
//

#import "NSString+FCUtils.h"

@implementation NSString (FCUtils)

- (NSString *)stringWithMixedWords
{
    __block NSString *result = @"";
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords
                          usingBlock:
     ^(NSString *word, NSRange wordRange, NSRange enclosingRange, BOOL *stop) {
        
         NSString *wordWithEnclosing = [self substringWithRange:enclosingRange];
         
         if (wordRange.length > 3) {
             NSArray *enclosingStrings = [wordWithEnclosing componentsSeparatedByString:word];
             
             if (enclosingRange.location == 0)
                result = [enclosingStrings firstObject];
             
             // Create array of characters (from second till penultimate)
             NSMutableArray *innerCharacters = [[NSMutableArray alloc] initWithCapacity:[word length]];
             for (int i = 1; i < [word length] - 1; i++) {
                 //NSString *ichar  = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];
                 NSString *ichar  = [word substringWithRange:NSMakeRange(i, 1)];
                 [innerCharacters addObject:ichar];
             }
             
             // Mix inner characters
             [innerCharacters enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                 [innerCharacters exchangeObjectAtIndex:idx withObjectAtIndex:arc4random_uniform((int32_t)idx)];
             }];
             NSArray *mixedCharacters = [NSArray arrayWithArray:innerCharacters];
             NSString *mixedCharactersString = [[mixedCharacters valueForKey:@"description"] componentsJoinedByString:@""];
             
             // Add first and last characters back
             NSString *mixedWord = [[[word substringWithRange:NSMakeRange(0, 1)]
                                     stringByAppendingString:mixedCharactersString]
                                    stringByAppendingString:[word substringWithRange:NSMakeRange([word length] - 1, 1)]];
             
             // Append mixed word to result
             result = [result stringByAppendingString:mixedWord];
             
             // Add non-word symbols after word
             result = [result stringByAppendingString:[enclosingStrings lastObject]];
         } else {
             result = [result stringByAppendingString:wordWithEnclosing];
         }
     }];
    
    return result;
}

@end
