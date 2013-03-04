//
//  ExistingCourseSearchController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/19/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoChoiceViewController;


@interface ExistingCourseSearchController : UIViewController <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *resultsTable;
	IBOutlet UISearchBar *searchBar;
	GoChoiceViewController *goChoiceViewController;
	BOOL searching;
	BOOL letUserSelectRow;
}

@property (retain, nonatomic) UITableView *resultsTable;
@property (retain, nonatomic) UISearchBar *searchBar;
@property (retain, nonatomic) GoChoiceViewController *goChoiceViewController;
@property (nonatomic) BOOL searching;
@property (nonatomic) BOOL letUserSelectRow;

- (void)doneSearching_Clicked:(id)sender;
@end
