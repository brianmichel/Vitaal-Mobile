//
//  FriendsViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *kItemFullNameKey;
extern NSString *kItemProfilePictureKey;
extern NSString *kItemCurrentStatusKey;

@class CustomFriendCell;
@class Vitaal_MobileAppDelegate;

@interface FriendsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	IBOutlet UITableView *friendsTable;
	NSDictionary	*friendInfo;
	NSDictionary *friendData;
}

@property (retain, nonatomic) UITableView *friendsTable;
@property (retain, nonatomic) NSDictionary *friendInfo;
@property (retain, nonatomic) NSDictionary *friendData;

@end
