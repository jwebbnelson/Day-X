//
//  PageViewContollerDataSource.m
//  DayX
//
//  Created by Jordan Nelson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailPageViewContollerDataSource.h"
#import "EntryController.h"
#import "DXDetailViewController.h"

@implementation DetailPageViewContollerDataSource

#pragma - mark viewControllerAtIndex
-(UIViewController *)viewControllerAtIndex:(NSInteger)index{
    
    if (index < 0 || index >= [[EntryController sharedInstance].entries count]){
        return  nil;
    }
    DXDetailViewController *viewController = [DXDetailViewController new];
    viewController.index = index;
    [viewController updateWithEntry:[EntryController sharedInstance].entries[index]];
    
    return viewController;
}

#pragma - mark viewControllerBeforeController
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(DXDetailViewController *)viewController{
    
    NSInteger beforeIndex = viewController.index - 1;
    
    return [self viewControllerAtIndex:beforeIndex];
}

#pragma - mark viewControllerAfterViewController
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(DXDetailViewController *)viewController{
    
    NSInteger afterIndex = viewController.index + 1;
    
    return [self viewControllerAtIndex:afterIndex];
}
@end
