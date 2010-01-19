//
//  States.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "States.h"

@implementation States


- (void)dealloc {
    [super dealloc];
}


- (NSArray *)statesArray {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];

    // path is autoreleased  Don't retain it.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    
    NSDictionary *tempDict;
    tempDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    for(NSString *aState in tempDict) {
        [resultsArray addObject:aState];
    }
    [tempDict release];        
    
    // Sort resultsArray alphabetically
    [resultsArray sortUsingSelector:@selector(compare:)];
    
    // TODO: Get only the top level values, not the whole dictionary        
    // [tempDict objectForKey:@"Alabama"];
    // ????: can do plist objectForKey:@"Alabama"  ???????
    // [tempDict valueForKey:aKey];
    
    // [resultsArray count] = 18
    NSLog(@"resultsArray count = %d", [resultsArray count]);
    NSLog(@"resultsArray = %@", resultsArray);
    [resultsArray autorelease];
    return resultsArray;
}


@end
