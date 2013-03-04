//
//  CustomFriendCell.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/17/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "CustomFriendCell.h"


@implementation CustomFriendCell

@synthesize fullName, currentStatus, profilePicture;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
