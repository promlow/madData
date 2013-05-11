//
//  MDUtil.m
//  MadData
//
//  Created by Paul Romlow on 5/11/13.
//  Copyright (c) 2013 Paul Romlow. All rights reserved.
//

#import "MDUtil.h"

@implementation MDUtil

static NSString *docsDir;

+(NSString*) getUserDocumentDir
{
    if(!docsDir)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = [paths objectAtIndex:0];
    }
    return docsDir;
}

@end
