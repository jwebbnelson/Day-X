//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//
#import "ListTableViewDataSource.h"
#import "EntryController.h"

@implementation ListTableViewDataSource

#pragma registerTableView Method
- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma numberOfRowsInSection Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController sharedInstance].entries.count;
}

#pragma cellForRowAtIndexPath Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = entry.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [[EntryController sharedInstance] removeEntry:[[EntryController sharedInstance].entries objectAtIndex:indexPath.row]];
        // Animation Selection
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


@end