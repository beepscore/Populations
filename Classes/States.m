//
//  States.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "States.h"

@implementation States

@synthesize statesArray;

- (id)init {
    self = [super init];
    if (self) {
        statesArray = [[NSMutableArray alloc] init];

        // path is autoreleased  Don't retain it.
        NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        
        NSDictionary *tempDict;
        tempDict = [[NSDictionary alloc] initWithContentsOfFile:path];
        
        for(NSString *aState in tempDict){
            [self.statesArray addObject:aState];
        }
        [tempDict release];        
 
        // Sort statesArray alphabetically
        [self.statesArray sortUsingSelector:@selector(compare:)];
        
        // TODO: Get only the top level values, not the whole dictionary        
        // [tempDict objectForKey:@"Alabama"];
        // ????: can do plist objectForKey:@"Alabama"  ???????
        // [tempDict valueForKey:aKey];
        
        // [self.statesArray count] = 19, note one is not a state
        NSLog(@"statesArray count = %d", [self.statesArray count]);
        NSLog(@"statesArray = %@", self.statesArray);

    }
    return self;
}


- (void)dealloc {
    [statesArray release], statesArray = nil;
    [super dealloc];
}

@end
