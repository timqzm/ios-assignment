//
//  AppDelegate.m
//  Assignment
//
//  Created by Timofey Kuzmin on 17/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import "AppDelegate.h"
#import "EmployeeDirectory.h"
#import "TableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITableViewController *tableViewController = [[TableViewController alloc] initWithEmployeeDataSource:[EmployeeDirectory new]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
