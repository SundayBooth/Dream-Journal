//
//  RootViewController.h
//  Dream Journal
//
//  Created by Bryan Sunday-Booth on 10/4/11.
//  Copyright 2011 Benedick Design Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dream, AddViewController, DetailViewController;

@interface RootViewController : UITableViewController {
    
    SQLAppDelegate *appDelegate;
    AddViewController *avController;
    UINavigationController *addNavigationController;
}

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
