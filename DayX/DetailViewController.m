//
//  DetailViewController.m
//  DayX
//
//  Created by Jordan Nelson on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DayX";
    
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    //Remove Keyboard
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)buttonPressed:(id)sender {
    self.textField.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
