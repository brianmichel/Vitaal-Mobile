//
//  AroundMeViewController.m
//  Vitaal Mobile
//
//  Created by Brian Michel on 1/29/10.
//  Copyright 2010 GbSi. All rights reserved.
//

#import "AroundMeViewController.h"
#import "MyAnnotation.h"


@implementation AroundMeViewController


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	mapView.mapType = MKMapTypeStandard;
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	
	span.latitudeDelta = 0.03;
	span.longitudeDelta = 0.03;
	
	CLLocationCoordinate2D location;
	location.latitude = 39.952335;
	location.longitude = -75.163789;
	
	MyAnnotation *ann = [[MyAnnotation alloc] init];
	ann.title = @"Philadelphia";
	ann.subtitle = @"Pennsylvania";
	ann.coordinate = location;
	
	CLLocationCoordinate2D location2;
	location2.latitude = 39.941086;
	location2.longitude = -75.174785;
	
	MyAnnotation *briansHouse = [[MyAnnotation alloc] init];
	briansHouse.title = @"Brian's Run";
	briansHouse.subtitle = @"Difficulty: 2";
	briansHouse.coordinate = location2;
	
	CLLocationCoordinate2D location3; 
	location3.latitude = 39.955295;
	location3.longitude = -75.187064;
	
	MyAnnotation *drexelU = [[MyAnnotation alloc] init];
	drexelU.title = @"Dragon Run";
	drexelU.subtitle = @"Difficulty: 4";
	drexelU.coordinate = location3;
	
	region.span = span;
	region.center = location;
	
	geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:location];
	geoCoder.delegate = self;
	[geoCoder start];
	
	[mapView setRegion:region animated:TRUE];
	[mapView regionThatFits:region];
 
	//[mapView addAnnotation:ann];
	[mapView addAnnotation:briansHouse];
	[mapView addAnnotation:drexelU];
	[self.view insertSubview:mapView atIndex:0];
	[mapView setDelegate:self];
	
	[drexelU release];
	[briansHouse release];
	[ann release];
	
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error	 {
	NSLog(@"Oops, I fucking failed.");
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
	NSLog(@"Found a fucking placemark.");
	mPlacemark = placemark;
	[mapView addAnnotation:placemark];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	MKPinAnnotationView *annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	annView.animatesDrop = TRUE;
	annView.canShowCallout = YES;
	annView.calloutOffset = CGPointMake(-5, 5);
	annView.pinColor = MKPinAnnotationColorPurple;
	return annView;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
