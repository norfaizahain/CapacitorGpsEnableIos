import { registerPlugin } from '@capacitor/core';

import type { CapacitorGpsEnableIosPlugin } from './definitions';

const CapacitorGpsEnableIos = registerPlugin<CapacitorGpsEnableIosPlugin>('CapacitorGpsEnableIos', {
  web: () => import('./web').then((m) => new m.CapacitorGpsEnableIosWeb()),
});

export * from './definitions';
export { CapacitorGpsEnableIos };
