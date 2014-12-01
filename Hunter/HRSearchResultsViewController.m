//
//  HRSearchResultsViewController.m
//  Hunter
//
//  Created by Comocomo on 11/20/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HRSearchResultsViewController.h"
#import "HRNavigationController.h"
#import "REFrostedViewController.h"
#import "DraggableViewBackground.h"

@interface HRSearchResultsViewController ()

@end

@implementation HRSearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home Controller";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MenuWhite"] style:UIBarButtonItemStylePlain target:(HRNavigationController *)self.navigationController action:@selector(showMenu)];


    self.frostedViewController.panGestureEnabled = NO;
    
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
    [self.view addSubview:draggableBackground];
}


@end
