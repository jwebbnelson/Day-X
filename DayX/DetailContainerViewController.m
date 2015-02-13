//
//  DetailContainerViewController.m
//  DayX
//
//  Created by Jordan Nelson on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailContainerViewController.h"
#import "DetailPageViewContollerDataSource.h"

@interface DetailContainerViewController ()

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) DetailPageViewContollerDataSource *dataSource;

@end

@implementation DetailContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageViewController =[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    
    self.dataSource = [DetailPageViewContollerDataSource new];
    
    self.pageViewController.dataSource = self.dataSource;
    
    [self.pageViewController setViewControllers:@[[self.dataSource viewControllerAtIndex:(int)self.initialIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
 
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
