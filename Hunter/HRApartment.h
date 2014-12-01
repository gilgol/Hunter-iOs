//
//  HRApartment.h
//  Hunter
//
//  Created by Comocomo on 11/24/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRApartment : NSObject

@property (nonatomic, strong) NSNumber *aptId;
@property (nonatomic, strong) NSNumber *roomateNumber;
@property (nonatomic, strong) NSNumber *roomsNumber;
@property (nonatomic, strong) NSNumber *cityId;
@property (nonatomic, strong) NSNumber *parkingId;
@property (nonatomic, strong) NSNumber *renovatedId;
@property (nonatomic, strong) NSNumber *purposeId;
@property (nonatomic, strong) NSNumber *sideId;
@property (nonatomic, strong) NSNumber *petsId;
@property (nonatomic, strong) NSNumber *smokeId;
@property (nonatomic, strong) NSNumber *balconyId;
@property (nonatomic, strong) NSNumber *elevatorId;
@property (nonatomic, strong) NSNumber *furnituredId;
@property (nonatomic, strong) NSNumber *subletId;
@property (nonatomic, strong) NSNumber *fromAgencyId;
@property (nonatomic, strong) NSNumber *floor;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *size;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSDate *createdDate;
@property (nonatomic, strong) NSString *userSearchId;
@property (nonatomic, strong) NSArray *imagesUrls;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *addressIds;
 
@end
