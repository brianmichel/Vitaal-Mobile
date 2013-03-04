//
//  LoadingViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 2/20/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoadingViewController : UIViewController {
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UILabel *currentStatus;
}

@property (retain, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (retain, nonatomic) UILabel *currentStatus;

@end
