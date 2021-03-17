#import "OkbatterieLibraryPlugin.h"
#if __has_include(<okbatterie_library/okbatterie_library-Swift.h>)
#import <okbatterie_library/okbatterie_library-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "okbatterie_library-Swift.h"
#endif

@implementation OkbatterieLibraryPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOkbatterieLibraryPlugin registerWithRegistrar:registrar];
}
@end
