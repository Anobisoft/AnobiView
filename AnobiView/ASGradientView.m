//
//  ASGradientView.m
//  AnobiView
//
//  Created by Stanislav Pletnev on 07.04.17.
//  Copyright © 2017 Anobisoft. All rights reserved.
//

#import "ASGradientView.h"

@implementation ASGradientView {
    CAGradientLayer *gradientLayer;
    UIColor *bgColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    gradientLayer.frame = self.layer.bounds;
    
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self addGradientLayerd];
    bgColor = self.backgroundColor;
    if (!bgColor) {
        bgColor = [self.tintColor colorWithAlphaComponent:0.0];
    }
    gradientLayer.startPoint = self.startPoint;
    gradientLayer.endPoint = self.endPoint;
    [self resetGradientColors];
}

- (void)resetGradientColors {
    if (!bgColor) bgColor = super.backgroundColor;
    if (self.tintColor && bgColor) {
        gradientLayer.colors = @[(id)bgColor.CGColor,
                                 (id)self.tintColor.CGColor];
#if !TARGET_INTERFACE_BUILDER
        [super setBackgroundColor:[UIColor clearColor]];
#endif
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {        
        [self addGradientLayerd];
        [self resetGradientColors];
    }
    return self;
}

- (void)addGradientLayerd {
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.masksToBounds = YES;

    [self.layer addSublayer:gradientLayer];
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    [self resetGradientColors];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    bgColor = backgroundColor;
    [self resetGradientColors];
}

- (void)setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    gradientLayer.startPoint = self.startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    gradientLayer.endPoint = self.endPoint;

}

@end
