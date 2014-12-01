//
//  HROtherViewController.m
//  Hunter
//
//  Created by Comocomo on 11/20/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HROtherViewController.h"
#import "HRNavigationController.h"
#import "REFrostedViewController.h"

@interface HROtherViewController ()

@end

@implementation HROtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second Controller";
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(HRNavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    self.frostedViewController.panGestureEnabled = YES;


}
@end
