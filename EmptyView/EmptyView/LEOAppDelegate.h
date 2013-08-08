//
//  LEOAppDelegate.h
//  EmptyView
//
//  Created by Wang Leo on 13-8-8.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class MainViewController;

@interface LEOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *rootNavigationController;
@property (strong, nonatomic) UINavigationController *mainNavigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@end
