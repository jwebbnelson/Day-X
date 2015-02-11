//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"
#import "Entry.h"

@implementation ListTableViewDataSource

#pragma registerTableView Method
- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma numberOfRowsInSection Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *entries = [Entry loadEntriesFromDefaults];
    return entries.count;
}

#pragma cellForRowAtIndexPath Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *entries = [Entry loadEntriesFromDefaults];
    Entry *entry = entries[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = entry.title;
    return cell;
}

@end
