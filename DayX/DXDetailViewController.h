//
//  DXDetailViewController.h
//  DayX
//
//  Created by Jordan Nelson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
// Import Entry class
@class Entry;

@interface DXDetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *dictionary;

@property (nonatomic, assign) NSInteger index;

-(void)updateWithDictionary:(NSDictionary *)dictionary;
-(void)updateWithEntry:(Entry*)entry;


@end
