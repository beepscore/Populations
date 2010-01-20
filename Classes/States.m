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
    [resultsArray autorelease];
    return resultsArray;
}


- (NSArray *)countiesArrayWithState:(NSString*)aState {
    
    NSMutableArray *countiesArray = [[NSMutableArray alloc] init];
    
    NSDictionary *countiesDictionary = [[self statesDictionary] objectForKey:aState];
    
    for (NSString *aCounty in countiesDictionary) {
        [countiesArray addObject:aCounty];
    }        
    
    // Sort resultsArray alphabetically
    [countiesArray sortUsingSelector:@selector(compare:)];    
    
    [countiesArray autorelease];
    return countiesArray;
}


- (NSDictionary *)countyDictionaryWithState:(NSString*)aState county:(NSString*)aCounty {
    
    // Get object 2 levels deep, for state for county    
    NSDictionary *countiesDictionary = [[NSDictionary alloc] 
                                        initWithDictionary:[[self statesDictionary] objectForKey:aState]];
    
    NSDictionary *countyDictionary = [[NSDictionary alloc] 
                                      initWithDictionary:[countiesDictionary objectForKey:aCounty]];
    [countiesDictionary release];
    
    [countyDictionary autorelease];
    return countyDictionary;
}


- (NSArray *)countyArrayWithState:(NSString*)aState county:(NSString*)aCounty {
    
    NSMutableArray *countyArray = [[NSMutableArray alloc] init];
    
    NSDictionary *countyDictionary = [self countyDictionaryWithState:aState county:aCounty];

    for (NSString *aKey in countyDictionary) {
        [countyArray addObject:[NSDictionary dictionaryWithObject:[countyDictionary objectForKey:aKey] forKey:aKey]];
    }
    [countyArray autorelease];
    return countyArray;
}

@end
