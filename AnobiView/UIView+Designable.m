//
//  UIView+Designable.m
//  AnobiView
//
//  Created by Stanislav Pletnev on 25/02/2019.
//  Copyright © 2019 Anobisoft. All rights reserved.
//

#import "UIView+Designable.h"

@implementation UIView (Designable)

#pragma mark - borderColor

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


#pragma mark - borderWidth

- (void)setBorderWidth:(CGFloat)borderWidth {
#if !TARGET_INTERFACE_BUILDER
    CGFloat screenScale = [UIScreen mainScreen].scale;
#else
    CGFloat screenScale = 2;
#endif
    self.layer.borderWidth = borderWidth / screenScale;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}


#pragma mark - cornerRadius

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}


@end
