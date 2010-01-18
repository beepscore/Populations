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
        // path is autoreleased  Don't retain it.
        NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        
        // TODO: Get only the top level values, not the whole dictionary
        self.statesArray = [[NSDictionary alloc] initWithContentsOfFile:path];
        // [self.statesArray count] = 19, note the last one is not a state
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
