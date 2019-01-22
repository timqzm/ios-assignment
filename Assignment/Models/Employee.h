//
//  Employee.h
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property (readonly, copy) NSString* name;
@property (readonly) NSUInteger birthYear;
@property (readonly, copy) NSDecimalNumber* salary;
@property (readonly, copy) NSString* salaryString; // to solve the performance bottleneck

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear;

- (NSString*)formatSalary;

@end

