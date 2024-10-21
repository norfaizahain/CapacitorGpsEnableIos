import { PluginListenerHandle,Plugin } from "@capacitor/core";
export interface LocationStatus {
  locationEnabled: boolean;
  latitude?: number;
  longitude?: number;
  locationChanged: boolean;
  message: string;
}
export declare type GpsIsEnabled = true;
export interface CapacitorGpsEnableIosPlugin extends Plugin{
  // echo(options: { value: string }): Promise<{ value: string }>;
  checkLocationStatus(): Promise<LocationStatus>;
  requestPermissions(): Promise<void>;
  dismissAlert():Promise<void>
  addListener(eventName: 'cancelAction' | 'locationStatusChange' | 'mockLocationDetected', listenerFunc: (info: any) => any): Promise<PluginListenerHandle>;
}
