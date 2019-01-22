//
//  Employee.m
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import "Employee.h"

static NSUInteger const kStartingSalary = 10000;
NSString* const kSalaryCurrency = @"EUR";

@implementation Employee

- (instancetype)initWithName:(NSString*)name birthYear:(NSUInteger)birthYear {
    self = [super init];
    if(self) {
        _name = name;
        _birthYear = birthYear;
        _salary = [[NSDecimalNumber alloc] initWithUnsignedInteger:kStartingSalary];
        _salaryString = [self formatSalary];
    }
    return self;
}

- (NSString*)formatSalary
{
    NSNumberFormatter* formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.currencyCode = kSalaryCurrency;
    return [formatter stringFromNumber:_salary];
}

@end
