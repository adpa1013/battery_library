#include "include/battery_library/battery_library_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <windows.h>
#include <map>
#include <memory>
#include <sstream>
#include <string.h>
#include <iostream>

namespace {

class BatteryLibraryPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BatteryLibraryPlugin();

  virtual ~BatteryLibraryPlugin();

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

// static
void BatteryLibraryPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "battery_library",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<BatteryLibraryPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

BatteryLibraryPlugin::BatteryLibraryPlugin() {}

BatteryLibraryPlugin::~BatteryLibraryPlugin() {}

void BatteryLibraryPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getPlatformVersion") == 0) {
    SYSTEM_POWER_STATUS spsPwr;
	if (GetSystemPowerStatus(&spsPwr))
	{
    std::string battery_state = std::to_string(static_cast<double>(spsPwr.BatteryLifePercent));
    result->Success(flutter::EncodableValue(battery_state));
  } 
    
  } else {
    result->NotImplemented();
  }
}

}  // namespace

void BatteryLibraryPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  BatteryLibraryPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
