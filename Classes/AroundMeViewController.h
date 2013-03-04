//
//  AroundMeViewController.h
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKReverseGeocoder.h>
@class MyAnnotation;


@interface AroundMeViewController : UIViewController <MKMapViewDelegate, MKReverseGeocoderDelegate> {
	IBOutlet UILabel *currentLocationLabel;
	IBOutlet MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;

}


@end
