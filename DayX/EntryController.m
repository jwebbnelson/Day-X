//
//  EntryController.m
//  DayX
//
//  Created by Jordan Nelson on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString *const entryListKey = @"entryListKey";

@interface EntryController()

// Allows assignment of entries property
@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

#pragma addEntry
-(void)addEntry:(Entry*)entry{
    if(!entry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    [mutableArray addObject:entry];
    
    self.entries = mutableArray;
    [self synchronize];
}

#pragma removeEntry
-(void)removeEntry:(Entry*)entry{
    if(!entry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    [mutableArray removeObject:entry];
    
    self.entries = mutableArray;
    [self synchronize];
}

#pragma replaceEntry
-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry{
    if(!oldEntry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    NSInteger oldEntryIndex = [mutableArray indexOfObject:oldEntry];
    [mutableArray replaceObjectAtIndex:oldEntryIndex withObject:newEntry];
    
    self.entries = mutableArray;
    [self synchronize];
}

#pragma loadFromDefaults
-(void)loadFromDefaults{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    self.entries = entryDictionaries;
}

#pragma synchronize
-(void)synchronize{
    self.entries = [[NSUserDefaults standardUserDefaults]objectForKey:entryListKey];
}



//#pragma loadEntriesFromDefaults
//    + (NSMutableArray *)loadEntriesFromDefaults {
//        NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
//        NSMutableArray *entries = [NSMutableArray new];
//        for (NSDictionary *entryDictionary in entryDictionaries) {
//            Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
//            [entries addObject:entry];
//        }
//        return entries;
//    }


@end
