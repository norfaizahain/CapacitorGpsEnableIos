import { PluginListenerHandle,Plugin } from "@capacitor/core";
export declare type GpsIsEnabled = true;
export interface CapacitorGpsEnableIosPlugin extends Plugin{
  // echo(options: { value: string }): Promise<{ value: string }>;
  // isGpsEnabled(): Promise<GpsIsEnabled>;
  requestPermissions(): Promise<void>;
  dismissAlert():Promise<void>
  addListener(eventName: 'cancelAction' | 'locationStatusChange' | 'mockLocationDetected', listenerFunc: (info: any) => any): Promise<PluginListenerHandle>;
}
