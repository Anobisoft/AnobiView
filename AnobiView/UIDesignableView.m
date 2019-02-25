//
//  UIDesignableView.m
//  AnobiView
//
//  Created by Stanislav Pletnev on 25/02/2019.
//  Copyright © 2019 Anobisoft. All rights reserved.
//

#import "UIDesignableView.h"

@implementation UIDesignableView {
    CGFloat screenScale;
}

- (void)awakeFromNib {
    [super awakeFromNib];
#if !TARGET_INTERFACE_BUILDER
    screenScale = [UIScreen mainScreen].scale;
#else
    screenScale = 2;
#endif
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.layer.masksToBounds = YES;
    self.clipsToBounds = YES;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}


@end
