//
//  CustomFriendCell.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/17/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomFriendCell : UITableViewCell {
	IBOutlet UILabel *fullName;
	IBOutlet UILabel *currentStatus;
	IBOutlet UIImageView *profilePicture;
}

@property (retain, nonatomic) UILabel *fullName;
@property (retain, nonatomic) UILabel *currentStatus;
@property (retain, nonatomic) UIImageView *profilePicture;

@end
