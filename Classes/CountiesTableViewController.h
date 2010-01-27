//
//  CountiesTableViewController.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountiesTableViewController : UITableViewController {
    NSArray *countyNames;
}
@property (nonatomic, copy) NSArray *countyNames;

// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle
              stateName:(NSString *)aStateName;

@end
