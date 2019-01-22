//
//  EmployeeDirectory.h
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import <Foundation/Foundation.h>

// notification posted when the directory finishes updating
extern NSString* const kEmployeeDirectoryDidUpdateNotification;

@interface EmployeeDirectory : NSObject

@property (readonly) NSArray* employees; // returns NSArray of Employee
@property (readonly) BOOL isUpdating;

- (void)update;
- (void)sort;

@end

