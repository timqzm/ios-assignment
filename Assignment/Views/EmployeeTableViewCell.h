//
//  EmployeeTableViewCell.h
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"

@interface EmployeeTableViewCell : UITableViewCell

- (void)configureWith:(Employee*)employee;

@end
