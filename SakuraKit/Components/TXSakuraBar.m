//
//  TXSakuraBar.m
//  SakuraKit
//
//  Created by tingxins on 27/06/2017.
//  Copyright © 2017 tingxins. All rights reserved.
//

#import "TXSakuraBar.h"

@implementation TXSakuraBar

#pragma mark - UIView

- (TXSakuraBarBlock)backgroundColor {
    return (TXSakuraBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UITabBar

- (TXSakuraBarBlock)unselectedItemTintColor {
    return (TXSakuraBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraBarBlock)itemBackgroundColor {
    return (TXSakuraBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraBarBlock)itemBackgroundImage {
    return (TXSakuraBarBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UIToolBar

- (TXSakuraBarBlock)barStyle {
    return (TXSakuraBarBlock)[super tx_sakuraBarStyleBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraBarBlock)backgroundImage {
    return (TXSakuraBarBlock)[super tx_sakuraImageBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraBarBlock)tintColor {
    return (TXSakuraBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

- (TXSakuraBarBlock)barTintColor {
    return (TXSakuraBarBlock)[super tx_sakuraColorBlockWithName:NSStringFromSelector(_cmd)];
}

#pragma mark - UISearchBar

- (TXSakuraBarBlock)keyboardAppearance {
    return (TXSakuraBarBlock)[super tx_sakuraKeyboardAppearanceBlockWithName:NSStringFromSelector(_cmd)];
}

@end

//TXSakuraCategoryImplementation(UITabBar, TXSakuraBar)
TXSakuraCategoryImplementation(UIToolbar, TXSakuraBar)
TXSakuraCategoryImplementation(UISearchBar, TXSakuraBar)

@implementation UITabBar  (TXSakuraBar)

@dynamic sakura;


- (TXSakuraBar *)sakura {
    TXSakuraBar *obj = objc_getAssociatedObject(self, kTXSakuraKey);
    if (!obj) {
        obj = [TXSakuraBar sakuraWithOwner:self];
        objc_setAssociatedObject(self, kTXSakuraKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}

- (void)setItemBackgroundColor:(UIColor *)tintColor {
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
        appearance.backgroundImage = [self createImageWithColor:tintColor];
        appearance.backgroundColor = tintColor;
        appearance.backgroundEffect = nil;
        
        UITabBarItem *item = self.items.firstObject;
        if (item) {
            NSDictionary<NSAttributedStringKey,id> * normalAttr = [item titleTextAttributesForState:UIControlStateNormal];
            NSDictionary<NSAttributedStringKey,id> * selectedAttr = [item titleTextAttributesForState:UIControlStateSelected];
            UIColor *normalColor = normalAttr[NSForegroundColorAttributeName];
            UIColor *selectedColor = selectedAttr[NSForegroundColorAttributeName];
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttr;
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttr;
            appearance.stackedLayoutAppearance.normal.iconColor = normalColor;
            appearance.stackedLayoutAppearance.selected.iconColor = selectedColor;
            appearance.shadowImage = [self createImageWithColor:[UIColor clearColor]];
        }
        
        if (@available(iOS 15.0, *)) {
            self.scrollEdgeAppearance = appearance;
        }
        self.standardAppearance = appearance;
    }else {
        self.backgroundImage =  [self createImageWithColor:tintColor];;
        self.backgroundColor = tintColor;
    }
}
- (void)setItemBackgroundImage:(UIImage *)image {
    UIImage * backgroundImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
        appearance.backgroundImage = backgroundImage;
//        appearance.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
        appearance.backgroundEffect = nil;
        
        UITabBarItem *item = self.items.firstObject;
        if (item) {
            NSDictionary<NSAttributedStringKey,id> * normalAttr = [item titleTextAttributesForState:UIControlStateNormal];
            NSDictionary<NSAttributedStringKey,id> * selectedAttr = [item titleTextAttributesForState:UIControlStateSelected];
            UIColor *normalColor = normalAttr[NSForegroundColorAttributeName];
            UIColor *selectedColor = selectedAttr[NSForegroundColorAttributeName];
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttr;
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttr;
            appearance.stackedLayoutAppearance.normal.iconColor = normalColor;
            appearance.stackedLayoutAppearance.selected.iconColor = selectedColor;
            appearance.shadowImage = [self createImageWithColor:[UIColor clearColor]];
        }
        
        if (@available(iOS 15.0, *)) {
            self.scrollEdgeAppearance = appearance;
        }
        self.standardAppearance = appearance;
    }else {
        self.backgroundImage = backgroundImage;
        self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
