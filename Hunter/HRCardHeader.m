//
//  HRCardHeader.m
//  Hunter
//
//  Created by Comocomo on 11/30/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HRCardHeader.h"

@implementation HRCardHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //aptType
        UILabel *typeLbl = [HRElementFactory labelWithText:NSLocalizedString(@"סוג הדירה", nil) Font:HELVETICA_LIGHT(13) Color:BLUE_COLOR ConstraintToSize:CGSizeMake(self.frame.size.width/3, 60)];
        typeLbl.center = CGPointMake(2*self.frame.size.width/3 + typeLbl.frame.size.width-10, self.frame.size.height/2);
        [self addSubview:typeLbl];
        
        //line
        UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, self.frame.size.height*0.3)];
        rightLine.center = CGPointMake(2*self.frame.size.width/3, self.frame.size.height/2);
        rightLine.backgroundColor = RGBA(135, 135, 135, 0.7);
        [self addSubview:rightLine];

        //aptType
        UILabel *cityLbl = [HRElementFactory labelWithText:NSLocalizedString(@"עיר", nil) Font:HELVETICA_LIGHT(13) Color:BLUE_COLOR ConstraintToSize:CGSizeMake(self.frame.size.width/3, 60)];
        cityLbl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:cityLbl];
        
        //line
        UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, self.frame.size.height*0.3)];
        leftLine.center = CGPointMake(self.frame.size.width/3, self.frame.size.height/2);
        leftLine.backgroundColor = RGBA(135, 135, 135, 0.7);
        [self addSubview:leftLine];

        //aptType
        UILabel *areaLbl = [HRElementFactory labelWithText:NSLocalizedString(@"אזור", nil) Font:HELVETICA_LIGHT(13) Color:BLUE_COLOR ConstraintToSize:CGSizeMake(self.frame.size.width/3, 60)];
        areaLbl.center = CGPointMake(self.frame.size.width/4 - 2*areaLbl.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:areaLbl];

        
    }
    return self;
}

@end
