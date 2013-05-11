//
//  MDRootViewController.m
//  MadData
//
//  Created by Paul Romlow on 5/11/13.
//  Copyright (c) 2013 Paul Romlow. All rights reserved.
//

#import "MDRootViewController.h"

@interface MDRootViewController ()

@end

@implementation MDRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.retriever = [[MDRetriever alloc] init];
        
        CGRect frame = [[UIApplication sharedApplication] keyWindow].frame;
        self.mapView = [[MKMapView alloc] initWithFrame:frame];
        [[[UIApplication sharedApplication] keyWindow] addSubview:_mapView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// At this time, assume everyone using the app is in Madison, WI
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    NSArray* policeCalls = [_retriever getPoliceCalls];
    NSLog(@"%@", policeCalls);    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
