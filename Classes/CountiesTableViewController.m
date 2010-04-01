//
//  CountiesTableViewController.m
//  Populations
//
//  Created by Steve Baker on 1/18/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "CountiesTableViewController.h"
#import "States.h"
#import "CountyDataTableViewController.h"


@implementation CountiesTableViewController

@synthesize countyNames;


#pragma mark initializers
// override superclass' designated initializer. Ref Hillegass pg 57
- (id)initWithStyle:(UITableViewStyle)aStyle {
    // call designated initializer
    return [self initWithStyle:aStyle stateName:@"Alabama"];
}


// designated initializer
- (id)initWithStyle:(UITableViewStyle)aStyle
              stateName:(NSString *)aStateName {
    // call super's designated intializer.  
    // Note UITableViewController may have 3 designated initializers.
    self = [super initWithStyle:aStyle];
    
    if (self) {
        // Set title using aStateName.  Also this will be displayed in the next higher view's back button.
        self.title = aStateName;
        
        States *tempStates = [[States alloc] init];
        self.countyNames = [tempStates countyNamesWithStateName:aStateName];
        [tempStates release];        
    }
    return self;    
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
    self.countyNames = nil;
    [super viewDidUnload];
}


- (void)dealloc {
    [countyNames release], countyNames = nil;
    [super dealloc];
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countyNames count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [self.countyNames objectAtIndex:indexPath.row];
    
    return cell;
}


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Navigation logic may go here -- for example, create and push another view controller.
    
    CountyDataTableViewController *countyDataTableViewController = 
    [[CountyDataTableViewController alloc] initWithStyle:UITableViewStyleGrouped
                                                   stateName:self.title
                                                  countyName:[self.countyNames objectAtIndex:indexPath.row]];
    
	[self.navigationController pushViewController:countyDataTableViewController animated:YES];
	[countyDataTableViewController release];    
}


@end