//
//  FCViewController.h
//  Fuzzy Chat
//
//  Created by Dmitry Volkov on 15/08/2013.
//  Copyright (c) 2013 Dmitry Volkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;

- (IBAction)fuzzIt:(id)sender;
- (IBAction)clear:(id)sender;

@end
