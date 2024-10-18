import {PluginListenerHandle, WebPlugin } from '@capacitor/core';

import type { CapacitorGpsEnableIosPlugin } from './definitions';

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
  async requestPermissions():Promise<void>{
    console.log("requestPermissions() from .ts customPlugin")
  }
  async dismissAlert():Promise<void>{
    console.log("requestPermissions() from .ts customPlugin")
  }
  async addListener(eventName: string, listenerFunc: (info: any) => any): Promise<PluginListenerHandle> {
    console.log(`Listener registered for event: ${eventName}`);
    console.log(listenerFunc)
    // For web, simply return a listener handle
    const handle = { remove: async () => console.log(`Listener for ${eventName} removed`) };
    return Promise.resolve(handle);
  }
}
