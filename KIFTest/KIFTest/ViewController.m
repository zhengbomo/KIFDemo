//
//  ViewController.m
//  KIFTest
//
//  Created by bomo on 2017/3/3.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import "NormalInputAccessoryView.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <UITextFieldDelegate, CLLocationManagerDelegate, NormalInputAccessoryViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *datePickerTf;
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UITextField *pickerTf;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, assign) NSInteger selectedFirst;
@property (nonatomic, assign) NSInteger selectedSecond;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pickerData = @[@[@"a", @"b", @"c"], @[@"1", @"2", @"3"]];
    
    [self.datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    NormalInputAccessoryView *inputTool = [NormalInputAccessoryView new];
    inputTool.textField = self.datePickerTf;
    inputTool.itemDelegate = self;
    inputTool.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    self.datePickerTf.inputAccessoryView = inputTool;
    self.datePickerTf.inputView = self.datePicker;
    
    NormalInputAccessoryView *inputTool2 = [NormalInputAccessoryView new];
    inputTool2.textField = self.pickerTf;
    inputTool2.itemDelegate = self;
    inputTool2.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    self.pickerTf.inputAccessoryView = inputTool2;
    self.pickerTf.inputView = self.pickerView;
}

-(void)datePickerValueChanged:(UIDatePicker *)sender
{
    if (self.isFirstResponder) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        self.datePickerTf.text = [formatter stringFromDate:sender.date];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)alert:(id)sender
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"abc" message:@"def" preferredStyle:UIAlertControllerStyleAlert];
    [vc addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
    [vc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)locationRequest:(id)sender
{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if ([CLLocationManager locationServicesEnabled]) {
            self.manager = [[CLLocationManager alloc] init];
            //获取授权认证
            self.manager.delegate = self;
            
            [self.manager requestAlwaysAuthorization];
            [self.manager startUpdatingLocation];
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"位置信息已经更新");
}

#pragma mark - NormalInputAccessoryViewDelegate
- (void)ok:(UITextField *)view
{
    if (view == self.datePickerTf) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        view.text = [formatter stringFromDate:self.datePicker.date];
        [view resignFirstResponder];
    } else {
        view.text = [NSString stringWithFormat:@"%@ %@", self.pickerData[0][self.selectedFirst], self.pickerData[1][self.selectedSecond]];
        [view resignFirstResponder];
    }
    
}

- (void)cancel:(UITextField *)view
{
    [view resignFirstResponder];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.pickerData.count;
}

//返回每列里边的行数（必须实现）
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.selectedFirst = row;
    } else if (component == 1) {
        self.selectedSecond = row;
    }
}

@end
