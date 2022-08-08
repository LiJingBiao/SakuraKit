//
//  TXSakuraSegment.m
//  SakuraKit
//
//  Created by LiJingBiao on 2022/8/8.
//

#import "TXSakuraSegment.h"

@implementation TXSakuraSegment


- (TXSakuraSegment2DStateBlock)titleTextAttributes {
    return (TXSakuraSegment2DStateBlock)[super tx_sakuraTitleTextAttributesForStateBlockWithName:NSStringFromSelector(_cmd)];
}

@end

TXSakuraCategoryImplementation(UISegmentedControl, TXSakuraSegment)
