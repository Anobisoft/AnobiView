//
//  ASGradientView.h
//  AnobiView
//
//  Created by Stanislav Pletnev on 07.04.17.
//  Copyright © 2017 Anobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AnobiView/UIView+Designable.h>

IB_DESIGNABLE

@interface ASGradientView : UIView

@property (nonatomic) IBInspectable CGPoint startPoint;
@property (nonatomic) IBInspectable CGPoint endPoint;

@end
