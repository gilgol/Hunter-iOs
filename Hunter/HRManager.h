//
//  HRManager.h
//  Hunter
//
//  Created by Comocomo on 11/24/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HRApartment;

@interface HRManager : NSObject

+ (HRManager *)sharedManager;

- (void)addToFavoriteApartment:(HRApartment *)apt;
- (void)addToDeletedApartment:(HRApartment *)apt;
//- (HRApartment *)getApartmentAtIndex:(NSInteger)index;

@property (nonatomic, strong) NSMutableArray *potentialApartments;
@property (nonatomic, strong) NSMutableArray *deletedApartments;
@property (nonatomic, strong) NSMutableArray *favoriteApartments;
@property (nonatomic, strong) NSMutableArray *searches;

@end
