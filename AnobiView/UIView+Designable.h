//
//  UIView+Designable.h
//  AnobiView
//
//  Created by Stanislav Pletnev on 25/02/2019.
//  Copyright © 2019 Anobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Designable)

@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end

NS_ASSUME_NONNULL_END
