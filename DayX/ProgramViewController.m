//
//  ProgramViewController.m
//  DayX
//
//  Created by Jordan Nelson on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProgramViewController.h"
#import "EntryController.h"

static NSString *subjectKey = @"subjectKey"; // Title
static NSString *entryKey = @"entryKey";     // Text
static NSString *journalKey = @"journalKey"; // Entry

@interface ProgramViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) Entry *entry;

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
    UIButton *clearButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 80, 60, 30)];
    clearButton.backgroundColor = [UIColor blueColor];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
   
#pragma Create SaveButton
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    self.textField.text = self.entry.title;
    self.textView.text = self.entry.text;
    
// Retrieve entry from NSUserDefaults
//    NSDictionary *journal = [[NSUserDefaults standardUserDefaults]objectForKey:journalKey];
//    [self updateWithDictionary:journal];
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
    self.textView.text = @"";
}

#pragma save Method
- (void)save:(id)sender {
    Entry *entry = [[Entry alloc]initWithDictionary: @{titleKey: self.textField.text, textKey: self.textView.text}];
    
    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];
    }

    [self.navigationController popViewControllerAnimated:YES];
}

#pragma updateWithDictionary Method
-(void)updateWithDictionary:(NSDictionary *)dictionary{
    self.textField.text = dictionary[subjectKey];
    self.textView.text = dictionary[entryKey];
}

-(void)updateWithEntry:(Entry*)entry{
    self.entry = entry;
    self.textField.text = entry.title;
    self.textView.text = entry.text;
    
}

@end
