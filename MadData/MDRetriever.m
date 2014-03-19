//
//  MDRetriever.m
//  MadData
//
//  Created by Paul Romlow on 5/11/13.
//  Copyright (c) 2013 Paul Romlow. All rights reserved.
//

#import "MDRetriever.h"
#import "MDUtil.h"

@interface MDRetriever()

-(NSArray*) retrieveData:(NSString*)dataIdentifier;

@end

@implementation MDRetriever

-(id)init
{
    if( (self = [super init]) )
    {
        NSString *docsDir = [MDUtil getUserDocumentDir];
        NSString *plist = [docsDir stringByAppendingPathComponent:DEFAULTS_PLIST];
        if(![[NSFileManager defaultManager] fileExistsAtPath:plist])
        {
            plist = [[NSBundle mainBundle] pathForResource:@"MDDefaults" ofType:@"plist"];
        }
        
        self.properties = [NSDictionary dictionaryWithContentsOfFile:plist];
    }
    return self;
}

// Calls a URL synchronously. DO NOT CALL FROM MAIN THREAD
-(NSArray*) retrieveData:(NSString*) dataIdentifier
{
    NSString* baseURL = [_properties objectForKey:@"cityDataURL"];
    
    NSURL *url = [NSURL URLWithString:[baseURL stringByAppendingString:dataIdentifier]];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:90.0];
    
    //TODO: Check for and handle errors
    NSData *data_resp = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    
    //TODO: Check for and handle errors
    return [NSJSONSerialization JSONObjectWithData:data_resp options:NSJSONReadingAllowFragments error:nil];
}

-(NSArray*) getPoliceCalls
{
    return [self retrieveData:[_properties objectForKey:@"mapPoliceCalls"]];
}

-(NSArray*) getFireHydrants
{
    return [self retrieveData:[_properties objectForKey:@"mapHydrants"]];
}

-(NSArray*) getBusStops
{
    return [self retrieveData:[_properties objectForKey:@"mapBusStops"]];
}

-(NSArray*) getCommLandSales
{
    return [self retrieveData:[_properties objectForKey:@"mapCommLandSales"]];
}

-(NSArray*) getLibraries
{
    return [self retrieveData:[_properties objectForKey:@"mapLibrary"]];
}

-(NSArray*) getPoliceFireStations
{
    return [self retrieveData:[_properties objectForKey:@"mapPoliceFireStations"]];
}

-(NSArray*) getVacantLandSales
{
    return [self retrieveData:[_properties objectForKey:@"mapVacantLandSales"]];
}

-(NSArray*) getPollingPlaces
{
    return [self retrieveData:[_properties objectForKey:@"mapPollingPlaces"]];
}

-(NSArray*) getParks
{
    return [self retrieveData:[_properties objectForKey:@"mapParks"]];
}
@end
