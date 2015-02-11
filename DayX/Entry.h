//
//  Entry.h
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma STEP 9
static NSString * const titleKey = @"title";
static NSString * const textKey = @"text";
static NSString * const timestampKey = @"timestamp";

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;

+ (NSMutableArray *)loadEntriesFromDefaults;
+ (void)storeEntriesInDefaults:(NSArray *)entries;

@end
