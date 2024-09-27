import { WebPlugin } from '@capacitor/core';

import type { CapacitorGpsEnableIosPlugin } from './definitions';

export class CapacitorGpsEnableIosWeb extends WebPlugin implements CapacitorGpsEnableIosPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
