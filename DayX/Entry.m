//
//  Entry.m
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString * const entriesKey = @"entries";

@implementation Entry

#pragma initWithDictionary
// Dictionaries to objects
-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.text = dictionary[textKey];
        self.timestamp = dictionary[timestampKey];
    }
    return self;
}

#pragma entryDictionary
- (NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.title) {
        [entryDictionary setObject:self.title forKey:titleKey];
        // entryDictionary[titleKey] = self.title;
    }
    if (self.text) {
        [entryDictionary setObject:self.text forKey:textKey];
    }
    if (self.timestamp) {
        [entryDictionary setObject:self.timestamp forKey:timestampKey];
    }
    return entryDictionary;
}

#pragma loadEntriesFromDefaults
+ (NSMutableArray *)loadEntriesFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entriesKey];
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    return entries;
}

#pragma storeEntriesInDefaults
+ (void)storeEntriesInDefaults:(NSArray *)entries {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entriesKey];
}


@end
