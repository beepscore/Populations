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

- (NSDictionary *)statesDictionary {
    // path is autoreleased  Don't retain it.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    
    NSDictionary *resultsDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    [resultsDictionary autorelease];
    return resultsDictionary;
}



- (NSArray *)statesArray {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];

    for(NSString *aState in [self statesDictionary]) {
        [resultsArray addObject:aState];
    }        
    
    // Sort resultsArray alphabetically
    [resultsArray sortUsingSelector:@selector(compare:)];
    
    // TODO: Get only the top level values, not the whole dictionary            
    // [resultsArray count] = 18
    NSLog(@"resultsArray count = %d", [resultsArray count]);
    NSLog(@"resultsArray = %@", resultsArray);
    [resultsArray autorelease];
    return resultsArray;
}


- (NSArray *)countiesArray:(NSString*)aStateKey {
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    NSDictionary *countiesDictionary = [[self statesDictionary] objectForKey:aStateKey];
    
    for(NSString *aCounty in countiesDictionary) {
        [resultsArray addObject:aCounty];
    }        

    // ????: can do plist objectForKey:@"Alabama"  ???????
    // [tempDict valueForKey:aKey];

    
    // Sort resultsArray alphabetically
    [resultsArray sortUsingSelector:@selector(compare:)];    
    
    NSLog(@"countiesArray count = %d", [resultsArray count]);
    NSLog(@"countiesArray = %@", resultsArray);
    [resultsArray autorelease];
    return resultsArray;
}



@end
