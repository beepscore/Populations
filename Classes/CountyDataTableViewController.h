//
//  CountyDataTableViewController.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountyDataTableViewController : UITableViewController {

    NSDictionary *countyDictionary;
}
@property (nonatomic, copy) NSDictionary *countyDictionary;

// designated initializer
- (id)initWithState:(NSString *)aStateName county:(NSString *)aCountyName;

@end
