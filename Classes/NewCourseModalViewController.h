//
//  NewCourseModalViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/20/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewCourseModalViewController : UITableViewController <UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate> {
	NSArray *tableData;
	NSArray *starsArray;
	
	UIActionSheet *sheet;
	IBOutlet UIPickerView *starsPicker;
	IBOutlet UITableViewCell *commentCell;
	IBOutlet UITextView	 *commentView;
	IBOutlet UITableView *entryTable;
	IBOutlet UITableViewCell *diffCell;
	IBOutlet UITableViewCell *mapCell;
	IBOutlet UITextField *courseTitle;
	IBOutlet UITableViewCell *cTitleCell;
}

@property (retain, nonatomic) UITableView *entryTable;
@property (retain, nonatomic) NSArray *tableData;
@property (retain, nonatomic) UIPickerView *starsPicker;
@property (retain, nonatomic) NSArray *starsArray;
@property (retain, nonatomic) UIActionSheet *sheet;
@property (retain, nonatomic) UITableViewCell *diffCell;
@property (retain, nonatomic) UITableViewCell *cTitleCell;
@property (retain, nonatomic) UITextField *courseTitle;
@property (retain, nonatomic) UITableViewCell *mapCell;
@property (retain, nonatomic) UITableViewCell *commentCell;
@property (retain, nonatomic) UITextView *commentView;

- (void)showPicker:(id)sender;

@end
