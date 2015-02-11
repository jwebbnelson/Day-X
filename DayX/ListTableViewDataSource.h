//
//  ListTableViewDataSource.h
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListTableViewDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView;

@end
