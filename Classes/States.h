//
//  States.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface States : NSObject {

}
// returns an alphabetically sorted array of state names
- (NSArray *)statesArray;

// returns an alphabetically sorted array of county names
- (NSArray *)countiesArrayWithState:(NSString*)aState;

// returns an array of dictionaries.  Each dictionary has one key-value pair.
- (NSArray *)countyArrayWithState:(NSString*)aState county:(NSString*)aCounty;

@end
