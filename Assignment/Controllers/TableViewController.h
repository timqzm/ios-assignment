//
//  TableViewController.h
//  Assignment
//
//  Created by Timofey Kuzmin on 21/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDirectory.h"

@interface TableViewController : UITableViewController

- (instancetype)initWithEmployeeDataSource:(EmployeeDirectory*)dataSource;

@end
