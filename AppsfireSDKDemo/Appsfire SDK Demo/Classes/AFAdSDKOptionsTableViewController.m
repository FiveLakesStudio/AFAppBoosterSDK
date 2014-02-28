//
//  AFAdSDKOptionsTableViewController.m
//  Appsfire SDK Demo
//
//  Created by Ali Karagoz on 20/12/2013.
//  Copyright (c) 2013 Appsfire. All rights reserved.
//

#import "AFAdSDKOptionsTableViewController.h"

// Appsfire
#import "AppsfireAdSDK.h"
#import "AppsfireAdTimerView.h"

typedef NS_ENUM(NSUInteger, AFAdSDKRow) {
    AFAdSDKRowSushi = 0,
    AFAdSDKRowTypeUramakiWithoutTimer,
    AFAdSDKRowTypeUramakiWithTimer,
    AFAdSDKRowNum
};

@interface AFAdSDKOptionsTableViewController ()

@end

@implementation AFAdSDKOptionsTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self == nil) {
        return nil;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Appsfire Ad SDK";
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return AFAdSDKRowNum;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
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
    
    // Text Label
    cell.textLabel.numberOfLines = 0;
    
    // Details Text Label
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0];
    
    switch (indexPath.row) {
            
        case AFAdSDKRowSushi: {
            cell.textLabel.text = @"Sushi";
        } break;
            
        case AFAdSDKRowTypeUramakiWithoutTimer: {
            cell.textLabel.text = @"Uramaki (without timer)";
        } break;
            
        case AFAdSDKRowTypeUramakiWithTimer: {
            cell.textLabel.text = @"Uramaki (with timer)";
        } break;
            
        default: {
        } break;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AFAdSDKModalType modalType;
    NSString *typeString;
    BOOL shouldUseTimer = NO;
    
    switch (indexPath.row) {
            
        case AFAdSDKRowSushi: {
            modalType = AFAdSDKModalTypeSushi;
            typeString = @"Sushi";
            shouldUseTimer = NO;
        } break;
            
        case AFAdSDKRowTypeUramakiWithoutTimer: {
            modalType = AFAdSDKModalTypeUraMaki;
            typeString = @"Uramaki";
            shouldUseTimer = NO;
        } break;

        case AFAdSDKRowTypeUramakiWithTimer: {
            modalType = AFAdSDKModalTypeUraMaki;
            typeString = @"Uramaki";
            shouldUseTimer = YES;
        } break;

        default: {
            modalType = AFAdSDKModalTypeSushi;
        } break;
    }

    if (![AppsfireAdSDK isThereAModalAdAvailable:modalType]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:typeString message:@"This Ad format is not yet ready, try again in a few seconds." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
    } else {
        
        // Showing a timer befor presenting the Ad.
        if (shouldUseTimer) {
            [[[AppsfireAdTimerView alloc] initWithCountdownStart:3] presentWithCompletion:^(BOOL accepted) {
                if (accepted) {
                    [AppsfireAdSDK requestModalAd:modalType withController:self];
                }
            }];
        }
        
        // Simply showing the Ad.
        else {
            [AppsfireAdSDK requestModalAd:modalType withController:self];
        }
    }
}

@end
