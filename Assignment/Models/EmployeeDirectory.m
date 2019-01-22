//
//  EmployeeDirectory.m
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import "EmployeeDirectory.h"
#import "Employee.h"

NSString* const kEmployeeDirectoryDidUpdateNotification = @"kEmployeeDirectoryDidUpdateNotification";

@interface EmployeeDirectory ()

@property (readonly) BOOL sortByName;

@end

@implementation EmployeeDirectory

NSComparisonResult (^sortByNameComparator)(Employee*, Employee*) = ^(Employee *employeeA, Employee *employeeB){
    return [employeeA.name compare:employeeB.name];
};

NSComparisonResult (^sortByBirthYearComparator)(Employee*, Employee*) = ^(Employee *employeeA, Employee *employeeB){
    return [[NSNumber numberWithInteger:employeeA.birthYear] compare:[NSNumber numberWithInteger:employeeB.birthYear]];
};

- (void)update {
    if(_isUpdating == YES) {
        return;
    }
    _isUpdating = YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self BA_doUpdateInBackground];
    });
}

- (void)sort {
    if(_isUpdating == YES) {
        return;
    }
    _isUpdating = YES;
    _sortByName = !_sortByName;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self BA_doSortInBackground];
    });
}

#pragma mark - Privates

- (void)BA_doUpdateInBackground {
    [NSThread sleepForTimeInterval:2];
    
    NSArray* name = @[@"Anne", @"Lucas", @"Marc", @"Zeus", @"Hermes", @"Bart", @"Paul", @"John", @"Ringo", @"Dave", @"Taylor"];
    NSArray* surnames = @[@"Hawkins", @"Simpson", @"Lennon", @"Grohl", @"Hawkins", @"Jacobs", @"Holmes", @"Mercury", @"Matthews"];
    
    NSUInteger amount = name.count*surnames.count;
    NSMutableArray* employees = [NSMutableArray arrayWithCapacity:amount];
    for(NSUInteger i=0; i<amount; i++) {
        NSString* fullName = [NSString stringWithFormat:@"%@ %@", name[random()%name.count], surnames[random()%surnames.count]];
        [employees addObject:[[Employee alloc] initWithName:fullName birthYear:1997-random()%50]];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self BA_updateDidFinishWithResults:employees];
    });
}

- (void)BA_doSortInBackground {
    NSArray* sortedEmployees = [_employees sortedArrayUsingComparator: _sortByName ? sortByNameComparator : sortByBirthYearComparator];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self BA_updateDidFinishWithResults:sortedEmployees];
    });
}

- (void)BA_updateDidFinishWithResults:(NSArray*)results {
    _employees = results;
    _isUpdating = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kEmployeeDirectoryDidUpdateNotification object:self];
}

@end
