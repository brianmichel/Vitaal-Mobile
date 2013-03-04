//
//  AddressAnnotation.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/31/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *mTitle;
	NSString *mSubTitle;
}

@end
