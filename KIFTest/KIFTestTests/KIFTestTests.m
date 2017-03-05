//
//  KIFTestTests.m
//  KIFTestTests
//
//  Created by bomo on 2017/3/3.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import "KIFUITestActor+Identifier.h"
#import "KIFTestTests-Swift.h"
#import <KIF/KIFTypist.h>

@interface KIFTestTests : KIFTestCase
@end

@implementation KIFTestTests

- (void)beforeAll
{
    //键盘输入延迟（输入太快在烂机器上会出错）
    KIFTypist.keystrokeDelay = 0.05;
}

- (void)afterEach
{
 
}

- (void)testExample
{
    //输入文本
    UIView *view = [tester waitForViewWithAccessibilityIdentifier:@"textField"];
    
    //注意输入文本前最好清除掉之前的文本
    [tester enterText:@"textField\n" intoViewWithAccessibilityIdentifier:@"textField"];
    [tester clearTextFromAndThenEnterText:@"textFieldccc\n" intoViewWithAccessibilityIdentifier:@"textField"];

    
    view = [tester waitForViewWithAccessibilityIdentifier:@"label"];
    view = [tester waitForViewWithAccessibilityIdentifier:@"view"];
    
    //Slider
    [tester setValue:0.5 forSlider:(UISlider *)[tester waitForViewWithAccessibilityIdentifier:@"slider"]];
    [NSThread sleepForTimeInterval:0.5];
    
    [tester setValue:1 forSlider:(UISlider *)[tester waitForViewWithAccessibilityIdentifier:@"slider"]];
    
    [tester setValue:0.1 forSlider:(UISlider *)[tester waitForViewWithAccessibilityIdentifier:@"slider"]];
    
    [tester setOn:NO forSwitchWithAccessibilityIdentifier:@"switch"];
    
    //DatePicker
    [tester tapViewWithAccessibilityIdentifier:@"datePicker"];
    NSArray *date = @[@"Sat Mar 4", @"3", @"32", @"AM"];
    [tester selectDatePickerValue:date];
    [tester tapViewWithAccessibilityIdentifier:@"accessoryView.done"];
    
    //Picker
    [tester tapViewWithAccessibilityIdentifier:@"picker"];
    [tester selectPickerViewRowWithTitle:@"c" inComponent:0];
    [tester selectPickerViewRowWithTitle:@"2" inComponent:1];
    [tester tapViewWithAccessibilityIdentifier:@"accessoryView.done"];
    
    //系统alert
    [tester tapViewWithAccessibilityIdentifier:@"systemAlert"];
    //监听系统框并选择最后一个按钮点击返回，如果没有，则延迟之后返回，如果有多个的话使用多个
    [tester handleSystemAlert];
    
    [tester tapViewWithAccessibilityIdentifier:@"alertView"];
    [tester tapViewWithAccessibilityLabel:@"好的"];
    
    [tester tapViewWithAccessibilityLabel:@"title"];
    
    //点击按钮
    [tester tapViewWithAccessibilityIdentifier:@"tableView"];

    //滑动
    [tester swipeViewWithAccessibilityIdentifier:@"tableView" inDirection:KIFSwipeDirectionUp];
    
    //点击cell
    for (int i = 0; i < 6; i+=2) {
        [tester tapRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] inTableViewWithAccessibilityIdentifier:@"tableView"];
    }
}

@end
