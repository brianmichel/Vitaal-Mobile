//
//  CustomHomeCell.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/17/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomHomeCell : UITableViewCell {
	IBOutlet UILabel *actionName;
	IBOutlet UILabel *lastUpdate;
	IBOutlet UIImageView *actionImage;
	
}

@property (nonatomic, retain) UILabel *actionName;
@property (nonatomic, retain) UILabel *lastUpdate;
@property (nonatomic, retain) UIImageView *actionImage;

@end
