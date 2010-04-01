//
//  CountyDataTableViewController.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "CountyDataTableViewController.h"
#import "States.h"


@implementation CountyDataTableViewController

@synthesize countyArray;
@synthesize viewTitle;


#pragma mark initializers
// override superclass' designated initializer. Ref Hillegass pg 57
- (id)initWithStyle:(UITableViewStyle)aStyle {
    // call designated initializer
    return [self initWithStyle:aStyle stateName:@"Alabama" countyName:@"Autauga County"];
}


// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle 
          stateName:(NSString *)aStateName 
         countyName:(NSString *)aCountyName {
    // call super's designated intializer.  
    // Note UITableViewController may have 3 designated initializers.
    self = [super initWithStyle:aStyle];
    if (self) {
        
        // Setup MVC Model
        States *tempStates = [[States alloc] init];
        self.countyArray = [tempStates countyArrayWithStateName:aStateName countyName:aCountyName];
        [tempStates release];
        
        // Don't setup view in an init method because it may not be completely loaded from nib.
        // Setup view in viewDidLoad method
        self.viewTitle = aCountyName;
    }
    return self;    
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup MVC View
    self.title = self.viewTitle;    
}


#pragma mark -
#pragma mark Memory management
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


// Ref http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmNibObjects.html
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
    // Release any retained outlets
    // set properties to nil, which also releases them
    self.countyArray = nil;
    self.viewTitle = nil;
    [super viewDidUnload];
}


- (void)dealloc {
    [countyArray release], countyArray = nil;
    [viewTitle release], viewTitle = nil;
    [super dealloc];
}


#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.countyArray count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // Here objectAtIndex:section returns a dictionary with one key-value pair.  Get the key.
    // ????: Is there a cleaner way to do this?
    return [[[self.countyArray objectAtIndex:section] allKeys] objectAtIndex:0];    
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    // Here objectAtIndex:indexPath.section returns a dictionary with one key-value pair.  Get the value.
    // ????: Is there a cleaner way to do this?
    cell.textLabel.text = [[[self.countyArray objectAtIndex:indexPath.section] allValues] objectAtIndex:0];
    
    return cell;
}

@end