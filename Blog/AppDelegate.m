//
//  AppDelegate.m
//  Blog
//
//  Created by Jianyu ZHU on 24/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "AppDelegate.h"
#import "BlogTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.rootViewController = [[BlogTableViewController alloc] init];

    return YES;
}


@end
