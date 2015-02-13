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

#pragma mark - addEntry
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
    if (!oldEntry || !newEntry) {
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    if([mutableArray containsObject:oldEntry]){
       NSInteger oldEntryIndex = [mutableArray indexOfObject:oldEntry];
       [mutableArray replaceObjectAtIndex:oldEntryIndex withObject:newEntry];
    }
    self.entries = mutableArray;
    
}

#pragma loadFromDefaults
-(void)loadFromDefaults{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entryDictionaries) {
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    
    self.entries = entries;
}

#pragma synchronize
-(void)synchronize{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries){
        [entryDictionaries addObject:[entry entryDictionary]];
    }

    [[NSUserDefaults standardUserDefaults]setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults]synchronize];

}

@end
