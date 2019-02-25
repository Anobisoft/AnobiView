//
//  ASGradientView.h
//  AnobiView
//
//  Created by Stanislav Pletnev on 07.04.17.
//  Copyright © 2017 Anobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AnobiView/UIDesignableView.h>

IB_DESIGNABLE

@interface ASGradientView : UIDesignableView

@property (nonatomic) IBInspectable CGPoint startPoint;
@property (nonatomic) IBInspectable CGPoint endPoint;

@end
