//
//  NSString+FCUtils.h
//  Fuzzy Chat
//
//  Created by Dmitry Volkov on 15/08/2013.
//  Copyright (c) 2013 Dmitry Volkov. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const FCWhiteSpace;

@interface NSString (FCUtils)

- (NSString *)stringWithMixedWords;

@end
