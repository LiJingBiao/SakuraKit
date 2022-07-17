//
//  TXSakuraController.h
//  SakuraDemo_OC
//
//  Created by tingxins on 01/08/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSakura.h"

TXSakuraBlockDeclare(TXSakuraController)

@interface TXSakuraController : TXSakura

- (TXSakuraControllerBlock)title;
- (TXSakuraControllerBlock)barTintColor;//设置导航栏颜色
- (TXSakuraControllerBlock)tintColor;//设置字体颜色
@end



@interface UIViewController (TXSakuraController)

@property (strong, nonatomic) TXSakuraController *sakura;
@property(nonatomic, strong) UIColor *barTintColor;//设置导航栏颜色
@property(nonatomic, strong) UIColor *tintColor;//设置字体颜色
@end
