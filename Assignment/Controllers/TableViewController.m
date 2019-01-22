//
//  TableViewController.m
//  Assignment
//
//  Created by Timofey Kuzmin on 21/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import "TableViewController.h"
#import "EmployeeTableViewCell.h"

@interface TableViewController ()

@property (readwrite, nonatomic) EmployeeDirectory* employeeDirectory;

@end

@implementation TableViewController

- (instancetype)initWithEmployeeDataSource:(EmployeeDirectory*)dataSource {
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        self.employeeDirectory = dataSource;
        [self fetchEmployees];
    }
    return self;
}

#pragma mark - Privates

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupNavigationBar];
}

- (void)fetchEmployees {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(onDataSourceUpdated:)
                                               name:kEmployeeDirectoryDidUpdateNotification
                                             object:nil];
    [self.employeeDirectory update];
}

- (void)onDataSourceUpdated:(NSNotification*)notification {
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void)setupTableView {
    self.tableView.allowsSelection = NO;
    [self.tableView registerClass:EmployeeTableViewCell.class forCellReuseIdentifier: NSStringFromClass(EmployeeTableViewCell.class)];
    self.tableView.estimatedRowHeight = 50.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(onRefreshRequested:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    if (self.employeeDirectory.isUpdating) {
        [self.refreshControl beginRefreshing];
    }
}

- (void)onRefreshRequested:(id)sender {
    if (!self.employeeDirectory.isUpdating) {
        [self.employeeDirectory update];
    }
}

- (void)setupNavigationBar {
    self.title = @"Employees";
    UIBarButtonItem* sortButton = [[UIBarButtonItem alloc] initWithTitle:@"Sort"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self.employeeDirectory
                                                                  action:@selector(sort)];
    self.navigationItem.rightBarButtonItem = sortButton;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.employeeDirectory.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell* cell = (EmployeeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(EmployeeTableViewCell.class)
                                                                                    forIndexPath:indexPath];
    [cell configureWith: self.employeeDirectory.employees[indexPath.row]];
    return cell;
}

@end
