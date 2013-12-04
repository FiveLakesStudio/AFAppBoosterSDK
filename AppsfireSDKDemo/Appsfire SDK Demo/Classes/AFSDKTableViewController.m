//
//  AFSDKTableViewController.m
//  Appsfire SDK Demo
//
//  Created by Ali Karagoz on 16/09/13.
//  Copyright (c) 2013 Appsfire. All rights reserved.
//

#import "AFSDKTableViewController.h"

#import "AppsfireAdSDK.h"
#import "AFSDKOptionsTableViewController.h"

typedef NS_ENUM(NSUInteger, AppsfireSDKRow) {
    AppsfireSDKRowSDK = 0,
    AppsfireSDKRowAdSDK,
    AppsfireSDKRowNum
};

@interface AFSDKTableViewController ()

@end

@implementation AFSDKTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self == nil) {
        return nil;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Title
    self.title = @"Appsfire SDK Demo";
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return AppsfireSDKRowNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configuring our cell
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.detailTextLabel.numberOfLines = 0;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case AppsfireSDKRowSDK: {
            cell.textLabel.text = @"Appsfire SDK";
            cell.detailTextLabel.text = @"See examples of the presentation styles and some provided UI elements.";
        } break;
            
        case AppsfireSDKRowAdSDK: {
            cell.textLabel.text = @"Appsfire Ad SDK";
            cell.detailTextLabel.text = @"See examples of the Ad overlay if available.";
        } break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
            
        case AppsfireSDKRowSDK: {
            self.appsfireSDKTableViewController = [[AFSDKOptionsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:self.appsfireSDKTableViewController animated:YES];
        } break;
            
        case AppsfireSDKRowAdSDK: {
            
            // Tries to show an interstitial
            [AppsfireAdSDK requestModalAdWithController:[UIApplication sharedApplication].keyWindow.rootViewController];
            
            // Or you can simply use your current view controller
            // [AppsfireAdSDK requestModalAdWithController:self];
        } break;
            
        default:
            break;
    }
}

@end
