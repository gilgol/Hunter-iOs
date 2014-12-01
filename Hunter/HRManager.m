//
//  HRManager.m
//  Hunter
//
//  Created by Comocomo on 11/24/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HRManager.h"

@interface HRManager () {
    
}

@end

@implementation HRManager


+ (HRManager *)sharedManager
{
    static dispatch_once_t pred;
    static HRManager *singleton = nil;
    dispatch_once(&pred, ^{
        singleton = [[HRManager alloc] init];
    });
    return singleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _potentialApartments = [[NSMutableArray alloc] initWithObjects:@"first",@"second",@"third",@"fourth",@"last",@"first",@"second",@"third",@"fourth",@"last", nil];
        _favoriteApartments = [NSMutableArray array];
        _deletedApartments = [NSMutableArray array];
        _searches = [NSMutableArray array];
        
        //check to see if info exists from previous activity
        
    }
    return self;
}

- (void)addToFavoriteApartment:(HRApartment *)apt
{
    [_favoriteApartments addObject:apt];
    
    if ([_potentialApartments containsObject:apt])
        [_potentialApartments removeObject:apt];
}

- (void)addToDeletedApartment:(HRApartment *)apt
{
    [_deletedApartments addObject:apt];
    
    if ([_potentialApartments containsObject:apt])
        [_potentialApartments removeObject:apt];

}

@end
