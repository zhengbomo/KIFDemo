//
//  NormalInputAccessoryView.h
//  KIFTest
//
//  Created by bomo on 2017/3/5.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NormalInputAccessoryViewDelegate <NSObject>

@required
- (void)ok:(UITextField * _Nullable)view;
- (void)cancel:(UITextField * _Nullable)view;

@end

@interface NormalInputAccessoryView : UIToolbar

@property (nonatomic, strong) UITextField *  _Nullable textField;
@property (nonatomic, weak) id<NormalInputAccessoryViewDelegate> _Nullable itemDelegate;

@end
