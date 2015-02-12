//
//  PageViewContollerDataSource.m
//  DayX
//
//  Created by Jordan Nelson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailPageViewContollerDataSource.h"
#import "EntryController.h"
#import "DetailViewController.h"

@implementation DetailPageViewContollerDataSource

-(UIViewController *)viewControllerAtIndex:(NSInteger)index{
    
    if (index < 0 || index > [[EntryController sharedInstance].entries count]){
        return  nil;
    }
    DetailViewController *viewController = [DetailViewController new];
    viewController.index = index;
    return viewController;
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(DetailViewController *)viewController{
    
    NSInteger beforeIndex = viewController.index - 1;
    
    return [self viewControllerAtIndex:beforeIndex];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(DetailViewController *)viewController{
    
    NSInteger afterIndex = viewController.index + 1;
    
    return [self viewControllerAtIndex:afterIndex];
}
@end
