//
//  KIFDemoTests.swift
//  KIFTest
//
//  Created by bomo on 2017/3/5.
//  Copyright © 2017年 bomo. All rights reserved.
//

import KIF

class KIFDemoTests: KIFTestCase {
    
    func testExample() {
        //输入文本
        let _ = tester().waitForView(withAccessibilityIdentifier: "textField");
        
        
        //注意输入文本前最好清除掉之前的文本
        tester().enterText("textField\n", intoViewWithAccessibilityIdentifier: "textField")
        tester().clearText(fromAndThenEnterText: "lal啦😋\n", intoViewWithAccessibilityIdentifier: "textField")
        
        let _ = tester().waitForView(withAccessibilityIdentifier: "label")
        let _ = tester().waitForView(withAccessibilityIdentifier: "view")
        
        let slider = tester().waitForView(withAccessibilityIdentifier: "slider") as! UISlider
        tester().setValue(0.5, for: slider)
        Thread.sleep(forTimeInterval: 0.2)
        tester().setValue(1, for: slider)
        Thread.sleep(forTimeInterval: 0.2)
        tester().setValue(0.1, for: slider)
        Thread.sleep(forTimeInterval: 0.2)
        
        tester().setOn(false, forSwitchWithAccessibilityIdentifier: "switch")
        
        //DatePicker
        tester().tapView(withAccessibilityIdentifier: "datePicker")
        let data = ["Sat Mar 4", "3", "32", "AM"]
        tester().selectDatePickerValue(data)
        tester().tapView(withAccessibilityIdentifier: "accessoryView.done")
        
        //Picker
        tester().tapView(withAccessibilityIdentifier: "picker")
        tester().selectPickerViewRow(withTitle: "c", inComponent: 0)
        tester().selectPickerViewRow(withTitle: "2", inComponent: 1)
        tester().tapView(withAccessibilityIdentifier: "accessoryView.done")
        
        //系统alert
        tester().tapView(withAccessibilityIdentifier: "systemAlert")
        tester().handleSystemAlert()
        
        tester().tapView(withAccessibilityIdentifier: "alertView")
        tester().tapView(withAccessibilityLabel: "好的")
        
        tester().tapView(withAccessibilityLabel: "title")
  
        //点击按钮
        tester().tapView(withAccessibilityIdentifier: "tableView")

        //滑动
        tester().swipeView(withAccessibilityIdentifier: "tableView", in: .up)
        for i in 1...6 {
            tester().tapRow(at: IndexPath(row: i, section: 0), inTableViewWithAccessibilityIdentifier: "tableView")
        }
    }
    
}
