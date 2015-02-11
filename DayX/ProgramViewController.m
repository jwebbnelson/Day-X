//
//  ProgramViewController.m
//  DayX
//
//  Created by Jordan Nelson on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProgramViewController.h"

static NSString *subjectKey = @"subjectKey"; // Title
static NSString *entryKey = @"entryKey";     // Text
static NSString *journalKey = @"journalKey"; // Entry

@interface ProgramViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation ProgramViewController

- (void)viewDidLoad {
    [super viewDidLoad];

// Set Title/BackgroundColor
    self.title = @"DayX";
    self.view.backgroundColor = [UIColor lightGrayColor];

#pragma Create TextField
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, 200, 30)];
    self.textField.placeholder = @"Subject";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    self.textField.delegate = self;
  
#pragma Create TextView
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(30, 130, self.view.frame.size.width - 60, self.view.frame.size.height - 200)];
    [self.view addSubview:self.textView];
    self.textView.delegate = self;
  
#pragma Create ClearButton
    UIButton *clearButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 80, 50, 30)];
    clearButton.backgroundColor = [UIColor greenColor];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
// Retrieve entry from NSUserDefaults
    NSDictionary *journal = [[NSUserDefaults standardUserDefaults]objectForKey:journalKey];
    [self updateWithDictionary:journal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Keyboard Removal
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// Clear Button Implementation
-(void)buttonPressed{
    self.textField.text = @"";
}

#pragma save Method
-(void)save: (id)sender {
    NSMutableDictionary *journalDictionary = [NSMutableDictionary new];

// Set subject/entry keys to textfield/textview .texts
    journalDictionary[subjectKey]= self.textField.text;
    journalDictionary[entryKey] = self.textView.text;
    
// Retrieve entry from NSUserDefaults
    [[NSUserDefaults standardUserDefaults]setObject:journalDictionary forKey:journalKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

#pragma updateWithDictionary Method
-(void)updateWithDictionary:(NSDictionary *)dictionary{
    self.textField.text = dictionary[subjectKey];
    self.textView.text = dictionary[entryKey];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self save:textField];
}

-(void)textViewDidChange:(UITextView *)textView {
    [self save:textView];
}

@end
