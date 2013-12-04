//
//  AFAppDelegate.h
//  Appsfire SDK Demo
//
//  Created by Ali Karagoz on 16/09/13.
//  Copyright (c) 2013 Appsfire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppsfireConvenienceDelegate.h"

@class AFSDKTableViewController;

@interface AppDelegate : AppsfireConvenienceDelegate

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) AFSDKTableViewController *tableViewController;

@end
