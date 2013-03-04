//
//  StatisticsViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vitaal_MobileAppDelegate;
@class MyTabBarController;


@interface StatisticsViewController : UIViewController <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UIView *portraitView;
	IBOutlet UIView *landscapeView;
	IBOutlet UITableView *statisticsTable;
	IBOutlet UITextField *statusField;
	IBOutlet UITableViewCell *headerCell;
	IBOutlet UIImageView *statisticsImageView;
	NSArray *listContents;
}

@property (retain, nonatomic) UIView *portraitView;
@property (retain, nonatomic) UIView *landscapeView;
@property (retain, nonatomic) UITableView *statisticsTable;
@property (retain, nonatomic) UITextField *statusField;
@property (retain, nonatomic) UITableViewCell *headerCell;
@property (retain, nonatomic) UIImageView *statisticsImageView;
@property (retain, nonatomic) NSArray *listContents;

@end
