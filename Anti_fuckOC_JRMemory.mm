#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CaptainHook/CaptainHook.h"


CHDeclareClass(UIView)
CHOptimizedMethod(1, self, void, UIView,addSubview,id,view){
	if ([view isKindOfClass:[UIView class]]) {
		UIView *target = view;
        if(target.alpha > 0.75 && target.alpha < 0.85){
			target.hidden = YES;
			[target removeFromSuperview];
			view = target;
		 }
	}
	CHSuper(1, UIView,addSubview,view);
}



// load
CHConstructor{
	CHLoadLateClass(UIView);
	CHClassHook(1, UIView,addSubview);
}
