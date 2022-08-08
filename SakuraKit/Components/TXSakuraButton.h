//
//  TXSakuraButton.h
//  SakuraKit
//
//  Created by tingxins on 26/06/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSakuraView.h"
TXSakuraBlockDeclare(TXSakuraButton)
TXSakura2DStateBlockDeclare(TXSakuraButton)

@interface TXSakuraButton : TXSakuraView
// UIView
- (TXSakuraButtonBlock)backgroundColor;
- (TXSakuraButtonBlock)alpha;
- (TXSakuraButtonBlock)tintColor;

// UIButton
- (TXSakuraButton2DStateBlock)titleColor;//setTitleColor:forState:
- (TXSakuraButton2DStateBlock)image;//setImage:forState:
- (TXSakuraButton2DStateBlock)backgroundImage;//setBackgroundImage:forState:
//自定义
- (TXSakuraButton2DStateBlock)backgroundStateColor;
@end

TXSakuraCategoryDeclare(UIButton, TXSakuraButton)
