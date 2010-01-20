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
- (NSArray *)countiesArrayWithState:(NSString*)aState;
- (NSDictionary *)countyDictionaryWithState:(NSString*)aState county:(NSString*)aCounty;

@end
