//
//  NormalInputAccessoryView.m
//  KIFTest
//
//  Created by bomo on 2017/3/5.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "NormalInputAccessoryView.h"


@interface NormalInputAccessoryView ()

@property (strong, nonatomic) UIBarButtonItem *cancelBtn;
@property (strong, nonatomic) UIBarButtonItem *doneBtn;


@end

@implementation NormalInputAccessoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ok:)];
        self.cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancel:)];
        self.doneBtn.accessibilityIdentifier = @"accessoryView.done";
        self.cancelBtn.accessibilityIdentifier = @"accessoryView.cancel";
        
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

        [self setItems:@[self.cancelBtn, flexibleSpace, self.doneBtn]];
    }
    return self;
}

- (IBAction)ok:(id)sender
{
    [self.itemDelegate ok:self.textField];
}

- (IBAction)cancel:(id)sender
{
    [self.itemDelegate cancel:self.textField];
}

@end
