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
- (NSArray *)countiesArrayWithState:(NSString*)aStateKey;
- (NSDictionary *)countyDictionaryWithState:(NSString*)aStateKey county:(NSString*)aCountyKey;

@end
