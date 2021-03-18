#import "BatterieLibraryPlugin.h"
#if __has_include(<batterie_library/batterie_library-Swift.h>)
#import <batterie_library/batterie_library-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "batterie_library-Swift.h"
#endif

@implementation BatterieLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBatterieLibraryPlugin registerWithRegistrar:registrar];
}
@end
