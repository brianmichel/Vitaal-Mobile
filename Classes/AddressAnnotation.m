//
//  AddressAnnotation.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/31/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "AddressAnnotation.h"


@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle {
	return @"Sub Title";
}

- (NSString *)title {
	return @"Title";
}

- (id)iniWithCoordinate:(CLLocationCoordinate2D)c {
	coordinate = c;
	NSLog(@"%f, %f", c.latitude, c.longitude);
	return self;
}

@end
