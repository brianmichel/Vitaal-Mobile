//
//  GoChoiceViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/17/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoViewController;
@class ExistingCourseSearchController;

@interface GoChoiceViewController : UIViewController <UINavigationBarDelegate, UITableViewDelegate, UITableViewDataSource> {
	GoViewController *goViewController;
	ExistingCourseSearchController *eCSController;
	IBOutlet UITableView *myTableView;
	IBOutlet UIButton *newCourse;
	IBOutlet UIButton *existingCourse;
	IBOutlet UITableViewCell *cell1;
	IBOutlet UITableViewCell *cell0;
	NSArray *listContents;
}

@property (retain, nonatomic) UIButton *newCourse;
@property (retain, nonatomic) UIButton *existingCourse;
@property (retain, nonatomic) GoViewController *goViewController;
@property (retain, nonatomic) ExistingCourseSearchController *eCSController;
@property (retain, nonatomic) UITableView *myTableView;
@property (retain, nonatomic) NSArray *listContents;
@property (retain, nonatomic) UITableViewCell *cell1;
@property (retain, nonatomic) UITableViewCell *cell0;

@end
