//
//  CountiesTableViewController.h
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountiesTableViewController : UITableViewController {
    // Xcode will automatically add instance variables to back properties
}
@property (nonatomic, copy) NSArray *countyNames;

// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle
              stateName:(NSString *)aStateName;

@end
