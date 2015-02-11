//
//  ProgramViewController.h
//  DayX
//
//  Created by Jordan Nelson on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
// Import Entry class
@class Entry;

@interface ProgramViewController : UIViewController

@property (nonatomic, strong) NSDictionary *dictionary;

-(void)updateWithDictionary:(NSDictionary *)dictionary;
-(void)updateWithEntry:(Entry*)entry;

@end
