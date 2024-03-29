//
//  AddViewController.m
//  Dream Journal
//
//  Created by Bryan Sunday-Booth on 10/4/11.
//  Copyright 2011 Benedick Design Studio. All rights reserved.
//

#import "AddViewController.h"
#import "Dream.h"

@implementation AddViewController

/*
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Add Coffee";
 
	self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
											  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
											   target:self action:@selector(cancel_Clicked:)] autorelease];
	
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
											   initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
											   target:self action:@selector(save_Clicked:)] autorelease];
	
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
 }


- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//Set the textboxes to empty string.
	txtCoffeeName.text = @"";
	txtPrice.text = @"";
	
	//Make the coffe name textfield to be the first responder.
	[txtCoffeeName becomeFirstResponder];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void) save_Clicked:(id)sender {
	
	SQLAppDelegate *appDelegate = (SQLAppDelegate *)[[[UIApplication sharedApplication] delegate]];
	
	//Create a Coffee Object.
	Coffee *coffeeObj = [[Coffee alloc] initWithPrimaryKey:0];
	coffeeObj.coffeeName = txtDreamName.text;
	NSDecimalNumber *temp = [[NSDecimalNumber alloc] initWithString:txtDescription.text];
	coffeeObj.price = temp;
	[temp release];
	coffeeObj.isDirty = NO;
	coffeeObj.isDetailViewHydrated = YES;
	
	//Add the object
	[appDelegate addCoffee:coffeeObj];
	
	//Dismiss the controller.
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void) cancel_Clicked:(id)sender {
	
	//Dismiss the controller.
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	
	[theTextField resignFirstResponder];
	return YES;
}

- (void)dealloc {
	[txtCoffeeName release];
	[txtCoffeeName release];
    [super dealloc];
}


@end
