//
//  TXSakuraController.m
//  SakuraDemo_OC
//
//  Created by tingxins on 01/08/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSakuraController.h"

@implementation TXSakuraController

- (TXSakuraControllerBlock)title {
    return (TXSakuraControllerBlock)[super tx_sakuraTitleBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraControllerBlock)tintColor {
    return (TXSakuraControllerBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraControllerBlock)barTintColor {
    return (TXSakuraControllerBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

@end

//TXSakuraCategoryImplementation(UIViewController, TXSakuraController)

extern void *kTXSakuraKey;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation UIViewController (TXSakuraController)
#pragma clang diagnostic pop

@dynamic sakura;


- (TXSakuraController *)sakura {
    TXSakuraController *obj = objc_getAssociatedObject(self, kTXSakuraKey);
    if (!obj) {
        obj = [TXSakuraController sakuraWithOwner:self];
        objc_setAssociatedObject(self, kTXSakuraKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}
//设置导航栏颜色hbd_barTintColor
- (void)setBarTintColor:(UIColor *)tintColor {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(setHbd_barTintColor:)]) {
        [self performSelector:@selector(setHbd_barTintColor:) withObject:tintColor];
    }
#pragma clang diagnostic pop
}
//设置字体颜色
- (void)setTintColor:(UIColor *)tintColor {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    if ([self respondsToSelector:@selector(setHbd_tintColor:)]) {
        [self performSelector:@selector(setHbd_tintColor:) withObject:tintColor];
        NSDictionary *dict = @{NSForegroundColorAttributeName:tintColor};
        [self performSelector:@selector(setHbd_titleTextAttributes:) withObject:dict];
        [self performSelector:@selector(hbd_setNeedsUpdateNavigationBar)];
        //[self.navigationController performSelector:@selector(updateNavigationBarTinitColorForViewController:) withObject:self];
    }
#pragma clang diagnostic pop
}

@end

