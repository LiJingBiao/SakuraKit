//
//  TXSakuraSegment.h
//  SakuraKit
//
//  Created by LiJingBiao on 2022/8/8.
//

#import "TXSakuraView.h"



TXSakuraBlockDeclare(TXSakuraSegment)
TXSakura2DStateBlockDeclare(TXSakuraSegment)

@interface TXSakuraSegment : TXSakuraView

- (TXSakuraSegment2DStateBlock)titleTextAttributes;


@end

TXSakuraCategoryDeclare(UISegmentedControl, TXSakuraSegment)


