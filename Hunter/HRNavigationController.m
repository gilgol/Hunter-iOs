//
//  HRNavigationController.m
//  Hunter
//
//  Created by Comocomo on 11/20/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HRNavigationController.h"
#import "HRMenuTableViewController.h"
#import "REFrostedViewController.h"

@interface HRNavigationController ()

@property (strong, readwrite, nonatomic) HRMenuTableViewController *menuViewController;

@end

@implementation HRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

#pragma mark - Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}

@end
