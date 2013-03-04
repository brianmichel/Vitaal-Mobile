//
//  homeTableViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsViewController;
@class SettingsViewController;
@class StatisticsViewController;
@class AroundMeViewController;
@class GoViewController;
@class GoChoiceViewController;
@class CustomHomeCell;


@interface HomeTableViewController : UITableViewController {
	GoViewController *goViewController;
	GoChoiceViewController *goChoiceViewController;
	AroundMeViewController *aroundMeViewController;
	StatisticsViewController *statisticsViewController;
	FriendsViewController *friendsVC;
	NSDictionary *mainScreenData;
	
	IBOutlet UITableView *HomeTableView;
	NSMutableArray *tableArray;
}

@property (nonatomic, retain) UITableView *HomeTableView;
@property (nonatomic, retain) NSMutableArray *tableArray;
@property (nonatomic, retain) FriendsViewController *friendsVC;
@property (nonatomic, retain) StatisticsViewController *statisticsViewController;
@property (nonatomic, retain) AroundMeViewController *aroundMeViewController;
@property (nonatomic, retain) GoViewController *goViewController;
@property (nonatomic, retain) GoChoiceViewController *goChoiceViewController;
@property (nonatomic, retain) NSDictionary *mainScreenData;

@end
