//
//  MDRootViewController.h
//  MadData
//
//  Created by Paul Romlow on 5/11/13.
//  Copyright (c) 2013 Paul Romlow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "MDRetriever.h"

@interface MDRootViewController : UIViewController

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) MDRetriever *retriever;
@end
