//
//  MyAnnotation.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/31/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate, title, subtitle;

- (void)dealloc {
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
