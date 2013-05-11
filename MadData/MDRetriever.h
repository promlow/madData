//
//  MDRetriever.h
//  MadData
//
//  Created by Paul Romlow on 5/11/13.
//  Copyright (c) 2013 Paul Romlow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDRetriever : NSObject

@property (strong, nonatomic) NSDictionary* properties;

-(NSArray*) getPoliceCalls;
-(NSArray*) getFireHydrants;
-(NSArray*) getBusStops;
-(NSArray*) getParks;
-(NSArray*) getLibraries;
-(NSArray*) getPoliceFireStations;
-(NSArray*) getVacantLandSales;
-(NSArray*) getCommLandSales;
-(NSArray*) getPollingPlaces;

@end
