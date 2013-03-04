//
//  Vitaal_MobileAppDelegate.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/28/10.
//  Copyright GbSi 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeViewController;

@interface Vitaal_MobileAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UITabBarController *rootController;
	IBOutlet HomeViewController *homeController;
	NSDictionary *friendData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) IBOutlet HomeViewController *homeController;
@property (nonatomic, retain) NSDictionary *friendData;

@end

