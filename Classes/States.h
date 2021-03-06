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
- (NSArray *)stateNames;

// returns an alphabetically sorted array of county names
- (NSArray *)countyNamesWithStateName:(NSString*)aStateName;


// returns an array of dictionaries.
// Each dictionary has one key-value pair. 
// The key describes the value, e.g. key="population increase", value = 200.

// Could have returned two arrays instead, one for keys and one for values.
// However that might increase the risk of mismatching keys and values.
// For example, allKeys and allValues return arrays from a dictionary, but the order is undefined.
// Kris Markel is pretty sure the order will be the same for allKeys and allValues
- (NSArray *)countyArrayWithStateName:(NSString*)aStateName countyName:(NSString*)aCountyName;

@end
