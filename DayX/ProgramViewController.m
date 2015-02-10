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
    // Do any additional setup after loading the view.
    self.title = @"DayX";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 80, 200, 30)];
    self.textField.placeholder = @"Subject";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    self.textField.delegate = self;
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(30, 130, self.view.frame.size.width - 60, self.view.frame.size.height - 200)];
    [self.view addSubview:self.textView];
    self.textView.delegate = self;
    
    UIButton *clearButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 80, 50, 30)];
    clearButton.backgroundColor = [UIColor greenColor];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearButton];
    
    
    NSDictionary *journal = [[NSUserDefaults standardUserDefaults]objectForKey:journalKey];
    [self updateWithDictionary:journal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)buttonPressed{
    self.textField.text = @"";
}

-(void)save {
    NSMutableDictionary *journalDictionary = [NSMutableDictionary new];
    
    journalDictionary[subjectKey]= self.textField.text;
    journalDictionary[entryKey] = self.textView.text;
    
    [[NSUserDefaults standardUserDefaults]setObject:journalDictionary forKey:journalKey];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
}

// Update the view with dictionary
-(void)updateWithDictionary:(NSDictionary *)dictionary{
    self.textField.text = dictionary[subjectKey];
    self.textView.text = dictionary[entryKey];
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.textView.text = @"";
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self save];
}

-(void)textViewDidChange:(UITextView *)textView {
    [self save];
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
