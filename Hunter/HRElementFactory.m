//
//  HRElementFactory.m
//  Hunter
//
//  Created by Comocomo on 11/30/14.
//  Copyright (c) 2014 goldengil. All rights reserved.
//

#import "HRElementFactory.h"

@implementation HRElementFactory

+ (UILabel *)labelWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color ConstraintToSize:(CGSize)constraintSize
{
    UIColor *colorToUse = (color ? color : [UIColor blackColor]);
//    UIFont *fontToUse = (font ? font : HELVETICA_MEDIUM(12));
    
    CGSize size = [text boundingRectWithSize:constraintSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{ NSFontAttributeName: font} context:nil].size;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    label.text = text;
    label.font = font;
    label.textColor = colorToUse;
    label.backgroundColor = [UIColor clearColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    
    return label;
    
}


@end
