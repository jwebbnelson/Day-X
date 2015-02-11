//
//  EntryController.m
//  DayX
//
//  Created by Jordan Nelson on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

@interface EntryController()

// Allows assignment of entries property
@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

//+ (EntryController *)sharedInstance {
//    static EntryController *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[EntryController alloc] init];
//        [sharedInstance loadFromDefaults];
//    });
//    return sharedInstance;
//}
#pragma addEntry
-(void)addEntry:(Entry*)entry{
    if(!entry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    [mutableArray addObject:entry];
    
    self.entries = mutableArray;
}

#pragma removeEntry
-(void)removeEntry:(Entry*)entry{
    if(!entry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    [mutableArray removeObject:entry];
    
    self.entries = mutableArray;
}

-(void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry{
    if(!oldEntry){
        return;
    }
    NSMutableArray *mutableArray = self.entries.mutableCopy;
    NSInteger oldEntryIndex = [mutableArray indexOfObject:oldEntry];
    [mutableArray replaceObjectAtIndex:oldEntryIndex withObject:newEntry];
    
    self.entries = mutableArray;
}
@end
