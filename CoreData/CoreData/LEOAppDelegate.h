//
//  LEOAppDelegate.h
//  CoreData
//
//  Created by Wang Leo on 13-8-12.
//  Copyright (c) 2013年 Wang Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
