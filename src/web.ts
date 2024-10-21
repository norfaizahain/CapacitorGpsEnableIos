import {PluginListenerHandle, WebPlugin } from '@capacitor/core';

import type { CapacitorGpsEnableIosPlugin, LocationStatus} from './definitions';

export class CapacitorGpsEnableIosWeb extends WebPlugin implements CapacitorGpsEnableIosPlugin {
  // async echo(options: { value: string }): Promise<{ value: string }> {
  //   console.log('ECHO', options);
  //   return options;
  // }
  // async isGpsEnabled(): Promise<GpsIsEnabled> {
  //   console.log("testing");
  //   const output = true;
  //   return output;
  // }
  // locationEnabled: boolean;
  // latitude?: number;
  // longitude?: number;
  // locationChanged: boolean;
  // message: string;
  async requestPermissions():Promise<void>{
    console.log("requestPermissions() from .ts customPlugin")
  }
  async dismissAlert():Promise<void>{
    console.log("requestPermissions() from .ts customPlugin")
  }
  async checkLocationStatus():Promise<LocationStatus>{
    console.log("requestPermissions() from .ts customPlugin")
    const output = {
      locationEnabled: true,
      latitude: 0,
      longitude:0,
      locationChanged:true,
      message: ""
    }
    return output
  }
  async addListener(eventName: string, listenerFunc: (info: any) => any): Promise<PluginListenerHandle> {
    console.log(`Listener registered for event: ${eventName}`);
    console.log(listenerFunc)
    // For web, simply return a listener handle
    const handle = { remove: async () => console.log(`Listener for ${eventName} removed`) };
    return Promise.resolve(handle);
  }
}
