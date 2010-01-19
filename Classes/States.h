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
- (NSArray *)countiesArray:(NSString*)aStateKey;

@end
