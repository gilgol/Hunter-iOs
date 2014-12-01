//
//  HRElementFactory.h
//  Hunter
//
//  Created by Comocomo on 11/30/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HRElementFactory : NSObject

+ (UILabel *)labelWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color ConstraintToSize:(CGSize)constraintSize;

@end
