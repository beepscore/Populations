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
- (NSArray *)statesArray;
- (NSArray *)countiesArrayForState:(NSString*)aStateKey;
- (NSDictionary *)countyDictionaryForState:(NSString*)aStateKey forCounty:(NSString*)aCountyKey;

@end
