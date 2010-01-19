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
    // [statesArray count] = 18
    NSLog(@"statesArray count = %d", [resultsArray count]);
    NSLog(@"statesArray = %@", resultsArray);
    [resultsArray autorelease];
    return resultsArray;
}


- (NSArray *)countiesArrayForState:(NSString*)aStateKey {
    
    NSMutableArray *countiesArray = [[NSMutableArray alloc] init];
    
    NSDictionary *countiesDictionary = [[self statesDictionary] objectForKey:aStateKey];
    
    for(NSString *aCounty in countiesDictionary) {
        [countiesArray addObject:aCounty];
    }        
    
    // Sort resultsArray alphabetically
    [countiesArray sortUsingSelector:@selector(compare:)];    
    
    NSLog(@"countiesArray count = %d", [countiesArray count]);
    NSLog(@"countiesArray = %@", countiesArray);
    [countiesArray autorelease];
    return countiesArray;
}


- (NSDictionary *)countyDictionaryForState:(NSString*)aStateKey forCounty:(NSString*)aCountyKey {
    
    // Get object 2 levels deep, for state for county    
    NSDictionary *countiesDictionary = [[NSDictionary alloc] 
                                        initWithDictionary:[[self statesDictionary] objectForKey:aStateKey]];
    
    NSDictionary *countyDictionary = [[NSDictionary alloc] 
                                      initWithDictionary:[countiesDictionary objectForKey:aCountyKey]];
    [countiesDictionary release];
    
    // ????: can do plist objectForKey:@"Alabama"  ???????
    // [tempDict valueForKey:aKey];
    
    NSLog(@"countyDictionary count = %d", [countyDictionary count]);
    NSLog(@"countyDictionary = %@", countyDictionary);
    [countyDictionary autorelease];
    return countyDictionary;
}


@end
