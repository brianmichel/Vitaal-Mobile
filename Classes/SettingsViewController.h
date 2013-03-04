//
//  AboutViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoadingViewController;


@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	LoadingViewController *loadingViewController;
	
	IBOutlet UIButton *loginButton;
	IBOutlet UIView *loadingView;
	IBOutlet UIView *tableHolderView;
	IBOutlet UITextField *usernameField;
	IBOutlet UITextField *passwordField;
	IBOutlet UIActivityIndicatorView *activity;
	IBOutlet UITableView *settingsTable;
	IBOutlet UITableViewCell *usernameCell;
	IBOutlet UITableViewCell *passwordCell;
	IBOutlet UITableViewCell *loginCell;
	NSArray *listContents;
	NSTimer *timer;
}

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)stopProgress:(id)sender;
- (IBAction)progressFake:(id)sender;
- (void)endProgressFake;

@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UITextField *usernameField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UIActivityIndicatorView *activity;
@property (nonatomic, retain) UITableView *settingsTable;
@property (nonatomic, retain) UITableViewCell *usernameCell;
@property (nonatomic, retain) UITableViewCell *passwordCell;
@property (nonatomic, retain) UITableViewCell *loginCell;
@property (nonatomic, retain) NSArray *listContents;
@property (nonatomic, retain) LoadingViewController *loadingViewController;
@property (nonatomic, retain) UIView *loadingView;
@property (nonatomic, retain) UIView *tableHolderView;

@end
