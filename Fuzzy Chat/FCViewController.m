//
//  FCViewController.m
//  Fuzzy Chat
//
//  Created by Dmitry Volkov on 15/08/2013.
//  Copyright (c) 2013 Dmitry Volkov. All rights reserved.
//

#import "FCViewController.h"
#import "NSString+FCUtils.h"

@interface FCViewController ()

@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [_textView becomeFirstResponder];
    
//    _textView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
}

- (IBAction)fuzzIt:(id)sender {
    if ([_textView.text length] > 0) {
        _textView.text = [_textView.text stringWithMixedWords];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = _textView.text;
    }
}

- (IBAction)clear:(id)sender {
    _textView.text = @"";
}

@end
