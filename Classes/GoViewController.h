//
//  GoViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewCourseModalViewController;


@interface GoViewController : UIViewController {
	NewCourseModalViewController *newCourseMVC;
	
	BOOL *stopped;
	NSTimer *timer;
	
	IBOutlet UIButton *startButton;
	IBOutlet UIButton *stopButton;
	IBOutlet UILabel *timerText;
}

@property (nonatomic, retain) UIButton *startButton;
@property (nonatomic, retain) UIButton *stopButton;
@property (nonatomic, retain) UILabel *timerText;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NewCourseModalViewController *newCourseMVC;

- (IBAction)startTimer:(id)sender;
- (IBAction)isStopped:(id)sender;
- (IBAction)pushModalView:(id)sender;
- (IBAction)closeModalView:(id)sender;

@end
