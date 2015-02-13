//
//  ListViewController.m
//  DayX
//
//  Created by Jordan Nelson on 2/10/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewDataSource.h"
#import "DXDetailViewController.h"
#import "EntryController.h"
#import "DetailContainerViewController.h"

@interface ListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ListTableViewDataSource *dataSource;

@end

@implementation ListViewController

// - SOLUTION BRANCH??
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set Title/BackgroundColor
    self.title = @"DayX";
    self.view.backgroundColor = [UIColor lightGrayColor];
 
// Initialize UIBarButtonItem
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = addButton;

// Initialize and add tableView to mainview
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
 
// Datasource/Delegate
    self.dataSource = [ListTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    [self.dataSource registerTableView:self.tableView];
}

#pragma add Method
- (void)add {
    
    DXDetailViewController *detailViewController = [DXDetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

#pragma mark - didSelectRowAtIndexPath
// Immediately deselects cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailContainerViewController *viewController = [DetailContainerViewController new];
    viewController.initialIndex = indexPath.row;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
