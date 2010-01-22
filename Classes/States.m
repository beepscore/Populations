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

    // pathForResource:ofType: returns an NSString object that will be autoreleased.
    // We point "path" to the object, but don't take ownership by retaining it. We don't need to release it.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    
    NSDictionary *resultsDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    [resultsDictionary autorelease];
    return resultsDictionary;
}


- (NSArray *)statesArray {

    // Sort alphabetically
    NSArray *resultsArray = [[[self statesDictionary] allKeys] sortedArrayUsingSelector:@selector(compare:)];
    return resultsArray;
}


- (NSArray *)countiesArrayWithState:(NSString*)aState {        

    NSDictionary *countiesDictionary = [[self statesDictionary] objectForKey:aState];
    // Sort alphabetically
    NSArray *countiesArray = [[countiesDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
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
